//
//  DCWebSocketInterface.m
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCWebSocketInterface.h"
#import "JSON.h"

@interface DCWebSocketInterface (Private)
-(void)handleMessage:(NSDictionary*)dict;
-(void)handleEvent:(NSString*)event data:(NSDictionary*)data;
-(void)handleResponse:(NSString*)r_id status:(NSString*)status data:(id)data;

-(void)writeRequest:(NSString*)request withID:(NSString*)r_id args:(id)args;
@end

@implementation DCWebSocketInterface

#pragma mark Public Functions

-(id)initWithURL:(NSURL*)host delegate:(id <DCConnectionInterfaceDelegate>)d
{
	if (self = [super initWithURL:host delegate:d])
	{
		url = host;
		[url retain];
		sock = [[AsyncSocket alloc] initWithDelegate:self];
	}
	return self;
}

-(void)connect
{
	[sock connectToHost:[url host] onPort:[[url port] intValue] withTimeout:60 error:nil];
}

-(void)close
{
	NSLog(@"Disconnecting socket");
	[sock disconnect];
}

#pragma mark Private Message Handlers

-(void)handleMessage:(NSDictionary *)dict
{
	NSString *str;
	
	if ((str = [dict objectForKey:@"event"]) != nil)
	{
		[self handleEvent:str data:[dict objectForKey:@"data"]];
	}
	else if ((str = [dict objectForKey:@"response"]) != nil)
	{
		[self handleResponse:str 
					  status:[dict objectForKey:@"status"] 
						data:[dict objectForKey:@"data"]];
	}
	else
	{
		NSLog(@"Unknown message");
	}
}

-(void)handleEvent:(NSString *)event data:(NSDictionary *)data
{
	NSLog(@"Got event %@ with data %@", event, data);
	if ([event isEqualToString:@"machine"])
	{
		[delegate drinkServerGotMachine:data];
	}
}

-(void)handleResponse:(NSString*)r_id status:(NSString*)status data:(id)data
{
	if ([r_id isEqualToString:@"machines"])
	{
		NSDictionary *dict = data;
		for (id machine in dict) {
			[delegate drinkServerGotMachine:[dict objectForKey:machine]];
		}
        // TODO: remove machines from delegate?
	}
    else if ([r_id isEqualToString:@"currentuser"])
    {
        NSDictionary *dict = data;
        [delegate drinkServerGotCurrentUser:dict];
    }
}

#pragma mark Requests

-(void)writeRequest:(NSString*)request withID:(NSString*)r_id args:(id)args
{
	NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
	NSString *json;
	NSData *data;
	NSMutableData *mdata;
	
	// Request object creation
	[obj setObject:request forKey:@"request"];
	[obj setObject:r_id forKey:@"id"];
	if (args == nil)
		args = [NSArray array];
	[obj setObject:args forKey:@"args"];
	
	// JSON Conversion
	json = [obj JSONRepresentation];
	NSLog(@"Sending: '%@'", json);
	[obj release];
	
	// WebSocket Framing
	data = [json dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	mdata = [NSMutableData dataWithCapacity:[data length] + 2];
	[mdata appendBytes:"" length:1];
	[mdata appendData:data];
	[mdata appendBytes:"\xFF" length:1];
	
	// Write to socket
	[sock writeData:mdata
		withTimeout:60 
				tag:0];
}

#pragma mark AsyncSocket Delegate Functions

-(void)onSocket:(AsyncSocket *)socket didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSData *response;
	char *delimeter = "\r\n\r\n";
	NSMutableString *str_response = [NSMutableString stringWithString:@"GET /drink/events HTTP/1.1\n"];
	[str_response appendString:@"Upgrade: WebSocket\n"];
	[str_response appendString:@"Connection: Upgrade\n"];
	[str_response appendFormat:@"Host: %@\n", host];
	[str_response appendFormat:@"Origin: http://%@\n", host];
	[str_response appendString:@"WebSocket-Protocol: drinkjson\n"];
	[str_response appendFormat:@"Cookie: drink_user=%@\n\n", [url user]];

	response = [str_response dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	
	[sock writeData:response
		withTimeout:60 
				tag:0];
	[sock readDataToData:[NSData dataWithBytes:delimeter length:4]
			 withTimeout:60 
					 tag:0];
	
	[delegate drinkServerDidConnect];
}

-(void)onSocket:(AsyncSocket *)socket didReadData:(NSData *)packet withTag:(long)tag
{
	if (tag) {
		// Strip off the framing
		NSData *data = [packet subdataWithRange:NSMakeRange(1, [packet length] -2)];
		// Convert to string
		NSString *str = [[[NSString alloc] initWithData:data
											   encoding:NSUTF8StringEncoding] autorelease];
		// WebSocket message		
		NSDictionary *msg = [str JSONValue];
		[self handleMessage:msg];
	}
	else
	{
		//NSString *str = [[NSString alloc] initWithData:packet
		//									  encoding:NSUTF8StringEncoding];
		// HTML Response
		//NSLog(@"Got Data:\n'%@'", str);
		//[str release];
	}
	[sock readDataToData:[NSData dataWithBytes:"\xFF" length:1]
			 withTimeout:60
					 tag:1];
}

-(void)onSocket:(AsyncSocket *)socket didWriteDataWithTag:(long)tag
{
//	NSLog(@"Successfully wrote message");
}

-(void)onSocketDidDisconnect:(AsyncSocket *)socket
{
	NSLog(@"Did disconnect");
}

-(void)onSocket:(AsyncSocket *)socket willDisconnectWithError:(NSError *)err
{
	[delegate drinkServerDidDisconnect];
	NSLog(@"Will disconnect: %@", err);
}

@end
