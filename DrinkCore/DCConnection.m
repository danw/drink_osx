//
//  DCConnection.m
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCConnection.h"
#import "DCWebSocketInterface.h"
#import "DCTestInterface.h"
#import "DCMachine.h"

@implementation DCConnection

+(BOOL)accessInstanceVariablesDirectly
{
	return NO;
}

-(id)initWithURL:(NSURL*)url
{
	if(self = [super init])
	{
		if ([[url scheme] isEqualToString:@"ws"] ||
			[[url scheme] isEqualToString:@"wss"])
		{
			conn = [[DCWebSocketInterface alloc] initWithURL:url
													   delegate:self];
		}
        else if ([[url scheme] isEqualToString:@"test"])
        {
            conn = [[DCTestInterface alloc] initWithURL:url delegate:self];
        }
		else
		{
			NSLog(@"Unknown url scheme!");
			[self release];
			self = nil;
		}

		if (self)
		{
			connected = NO;
			machines = [[NSMutableArray alloc] init];
		}
	}
	return self;
}

@synthesize connected;
@synthesize currentUser;

-(void)connect
{
	if (connected)
		return;
	[conn connect];
}

-(void)close
{
	[conn close];
	[conn release];
	conn = NULL;
}

-(void)drinkServerDidConnect
{
	[self willChangeValueForKey:@"connected"];
	connected = YES;
	[self didChangeValueForKey:@"connected"];
}

-(void)drinkServerDidDisconnect
{
	[self willChangeValueForKey:@"connected"];
	connected = NO;
	[self didChangeValueForKey:@"connected"];
}

-(void)drinkServerGotMachine:(NSDictionary*)machine
{
	NSString *mid = [machine objectForKey:@"machineid"];
	BOOL haveMachine = NO;

	NSAssert(mid, @"Must have machine id");

	for (DCMachine* m in machines)
	{
		if ([[m machineID] isEqualToString:mid])
		{
			haveMachine = YES;
			[m updateWithServerData:machine];
		}
	}
	
	if (!haveMachine)
	{
		NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:[machines count]];
		DCMachine *obj = [[DCMachine alloc] initWithServerData:machine];
		
		[self willChange:NSKeyValueChangeInsertion
		 valuesAtIndexes:indexes
				  forKey:@"machines"];
		[machines insertObject:obj atIndex:[machines count]];
		[self didChange:NSKeyValueChangeInsertion
		valuesAtIndexes:indexes
				 forKey:@"machines"];
	}
}

-(void)drinkServerGotCurrentUser:(NSDictionary*)user
{
    // TODO check for already existing user
    DCUser *duser = [[DCUser alloc] initWithServerData:user];
    
    [self willChangeValueForKey:@"currentUser"];
    currentUser = duser;
    [self didChangeValueForKey:@"currentUser"];
}

-(void)drinkServerMachineRemoved:(NSString*)machine
{
	DCMachine *obj = nil;
	NSIndexSet *indexes;
	NSUInteger index;
	
	for (DCMachine* m in machines)
	{
		if ([[m machineID] isEqualToString:machine])
		{
			obj = m;
		}
	}
	
	if (obj == nil) return;
	
	index = [machines indexOfObject:obj];
	indexes = [NSIndexSet indexSetWithIndex:index];
	
	[self willChange:NSKeyValueChangeRemoval
	 valuesAtIndexes:indexes
			  forKey:@"machines"];
	[machines removeObjectAtIndex:index];
	[self didChange:NSKeyValueChangeRemoval
	valuesAtIndexes:indexes
	         forKey:@"machines"];	
}

// Machine Accessors
-(NSArray*)machines
{
	return machines;
}

-(NSUInteger)countOfMachines
{
	return [machines count];
}

-(id)objectInMachinesAtIndex:(NSUInteger)index
{
	return [machines objectAtIndex:index];
}

-(NSArray*)machinesAtIndexes:(NSIndexSet *)indexes
{
	return [machines objectsAtIndexes:indexes];
}

@end
