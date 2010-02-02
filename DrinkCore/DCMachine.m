//
//  DCMachine.m
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCMachine.h"


@implementation DCMachine

+(BOOL)accessInstanceVariablesDirectly
{
	return NO;
}

-(id)initWithServerData:(NSDictionary*)data
{
	if ((self = [super init]))
	{
		machineID = [[data objectForKey:@"machineid"] copy];
		[self updateWithServerData:data];
	}
	
	return self;
}

@synthesize machineID;
@synthesize adminOnly;
@synthesize allowConnect;
@synthesize availableSensor;
@synthesize connected;
@synthesize machineIP;
@synthesize name;
@synthesize password;
@synthesize publicIP;
@synthesize temperature;

// TODO: manual KVO for non-changing key optimization

-(void)updateWithServerData:(NSDictionary*)data
{
	[self setValue:[data objectForKey:@"admin_only"] forKey:@"adminOnly"];
	[self setValue:[data objectForKey:@"allow_connect"] forKey:@"allowConnect"];
	[self setValue:[data objectForKey:@"available_sensor"] forKey:@"availableSensor"];
	[self setMachineIP:[data objectForKey:@"machine_ip"]];
	[self setName:[data objectForKey:@"name"]];
	[self setPassword:[data objectForKey:@"password"]];
	[self setPublicIP:[data objectForKey:@"public_ip"]];
	[self setTemperature:[data objectForKey:@"temperature"]];
	
	BOOL newConnected = [[data objectForKey:@"connected"] boolValue];
	if (connected != newConnected)
	{
		[self willChangeValueForKey:@"connected"];
		connected = newConnected;
		[self didChangeValueForKey:@"connected"];
	}
}

-(void)setNilValueForKey:(NSString *)key
{
	// TODO: do the right thing here, for admin/non-admin and server/user update cases
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"<DCMachine \"%@\" (%@)>", name, machineID];
}

@end
