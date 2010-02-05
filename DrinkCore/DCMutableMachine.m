//
//  DCMutableMachine.m
//  DrinkCore
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCMutableMachine.h"


@implementation DCMutableMachine

+(BOOL)accessInstanceVariablesDirectly
{
	return NO;
}

-(id)initWithMachine:(DCMachine*)m
{
    if ((self = [super init]))
    {
        serverMachine = [m retain];
        originalMachine = [m copy];
    }
    
    return self;
}

@synthesize serverMachine;
@synthesize originalMachine;

-(void)setMachineID:(NSString*)mid
{
    machineID = [mid copy];
}

-(void)setAdminOnly:(BOOL)ao
{
    adminOnly = ao;
}

-(void)setAllowConnect:(BOOL)ac
{
    allowConnect = ac;
}

-(void)setAvailableSensor:(BOOL)as
{
    availableSensor = as;
}

-(void)setMachineIP:(NSString*)mip
{
    machineIP = [mip copy];
}

-(void)setName:(NSString*)n
{
    name = [n copy];
}

-(void)setPassword:(NSString*)p
{
    password = [p copy];
}

-(void)setPublicIP:(NSString*)pip
{
    publicIP = [pip copy];
}

-(void)setTemperature:(NSNumber*)t
{
    temperature = [t copy];
}

@end
