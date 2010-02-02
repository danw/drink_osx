//
//  DrinkTestInterface.m
//  DrinkOSX
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "DrinkTestInterface.h"


@implementation DrinkTestInterface

-(id)initWithURL:(NSURL *)url delegate:(DrinkConnection*)d
{
    if ((self = [super init]))
    {
        delegate = d;
    }
    
    return self;
}

-(void)connect
{
    NSDictionary *user = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"inituser", @"username",
                          [NSNumber numberWithInt:300], @"credits",
                          [NSNumber numberWithInt:0], @"admin", 
                          nil];
    NSDictionary *machine = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"mid", @"machineid",
                             [NSNumber numberWithInt:0], @"admin_only",
                             [NSNumber numberWithInt:1], @"allow_connect",
                             [NSNumber numberWithInt:1], @"available_sensor",
                             @"192.168.1.3", @"machine_ip",
                             @"MachineName", @"name",
                             @"MachinePassword", @"password",
                             @"192.168.1.3", @"public_ip",
                             [NSNumber numberWithFloat:40.2f], @"temperature",
                             nil];
    
    [delegate drinkServerDidConnect];
    [delegate drinkServerGotCurrentUser:user];
    [delegate drinkServerGotMachine:machine];
    [delegate drinkServerMachineRemoved:@"mid"];
    [delegate drinkServerGotMachine:machine];
    [delegate drinkServerGotMachine:machine];
}

-(void)close
{
    [delegate drinkServerDidDisconnect];
}

@end
