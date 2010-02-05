//
//  DCMachine.m
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCMachine.h"
#import "DCMutableMachine.h"

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
   	BOOL newConnected = [[data objectForKey:@"connected"] boolValue];
    BOOL newAdminOnly = [[data objectForKey:@"admin_only"] boolValue];
    BOOL newAllowConnect = [[data objectForKey:@"allow_connect"] boolValue];
    BOOL newAvailableSensor = [[data objectForKey:@"available_sensor"] boolValue];
    NSString *newMachineIP = [data objectForKey:@"machine_ip"];
    NSString *newName = [data objectForKey:@"name"];
    NSString *newPassword = [data objectForKey:@"password"];
    NSString *newPublicIP = [data objectForKey:@"public_ip"];
    NSNumber *newTemperature = [data objectForKey:@"temperature"];
	
	if (connected != newConnected)
	{
		[self willChangeValueForKey:@"connected"];
		connected = newConnected;
		[self didChangeValueForKey:@"connected"];
	}
    
    if (adminOnly != newAdminOnly)
    {
        [self willChangeValueForKey:@"adminKey"];
        adminOnly = newAdminOnly;
        [self didChangeValueForKey:@"adminKey"];
    }
    
    if (allowConnect != newAllowConnect)
    {
        [self willChangeValueForKey:@"allowConnect"];
        allowConnect = newAllowConnect;
        [self didChangeValueForKey:@"allowConnect"];
    }
    
    if (availableSensor != newAvailableSensor)
    {
        [self willChangeValueForKey:@"availableSensor"];
        availableSensor = newAvailableSensor;
        [self didChangeValueForKey:@"availableSensor"];
    }
    
    if (machineIP == nil || ![newMachineIP isEqualToString:machineIP])
    {
        [self willChangeValueForKey:@"machineIP"];
        machineIP = [newMachineIP copy];
        [self didChangeValueForKey:@"machineIP"];
    }
    
    if (name == nil || ![newName isEqualToString:name])
    {
        [self willChangeValueForKey:@"name"];
        name = [newName copy];
        [self didChangeValueForKey:@"name"];
    }
    
    if (password == nil || ![newPassword isEqualToString:password])
    {
        [self willChangeValueForKey:@"password"];
        password = [newPassword copy];
        [self didChangeValueForKey:@"password"];
    }
    
    if (publicIP == nil || ![newPublicIP isEqualToString:publicIP])
    {
        [self willChangeValueForKey:@"publicIP"];
        publicIP = [newPublicIP copy];
        [self didChangeValueForKey:@"publicIP"];
    }
    
    if (temperature == nil || ![newTemperature isEqualToNumber:temperature])
    {
        [self willChangeValueForKey:@"temperature"];
        temperature = [newTemperature copy];
        [self didChangeValueForKey:@"temperature"];
    }
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"<DCMachine \"%@\" (%@)>", name, machineID];
}

-(DCMutableMachine*)mutableCopy
{
    return [[DCMutableMachine alloc] initWithMachine:self];
}

@end
