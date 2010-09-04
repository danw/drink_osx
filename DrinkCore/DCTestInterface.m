//
//  DCTestInterface.m
//  DrinkCore
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCTestInterface.h"


@implementation DCTestInterface

-(void)connect
{
    user = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"inituser", @"username",
            [NSNumber numberWithInt:300], @"credits",
            [NSNumber numberWithInt:0], @"admin", 
            nil] retain];
    machine = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
               @"mid", @"machineid",
               [NSNumber numberWithInt:0], @"admin_only",
               [NSNumber numberWithInt:1], @"allow_connect",
               [NSNumber numberWithInt:1], @"available_sensor",
               @"192.168.1.3", @"machine_ip",
               @"MachineName", @"name",
               @"MachinePassword", @"password",
               @"192.168.1.3", @"public_ip",
               [NSNumber numberWithFloat:40.2f], @"temperature",
               nil] retain];
    NSDictionary *machine2 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"little", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"LittleMachine", @"name",
                              @"MachinePassword", @"password",
                              @"192.168.1.3", @"public_ip",
                              [NSNumber numberWithFloat:40.2f], @"temperature",
                              nil];
    NSDictionary *machine3 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"m3", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"Machine3", @"name",
                              @"MachinePassword", @"password",
                              @"192.168.1.3", @"public_ip",
                              [NSNumber numberWithFloat:40.2f], @"temperature",
                              nil];
    NSDictionary *machine4 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"m4", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"Machine4", @"name",
                              @"MachinePassword", @"password",
                              @"192.168.1.3", @"public_ip",
                              [NSNumber numberWithFloat:40.2f], @"temperature",
                              nil];
    NSDictionary *machine5 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"m5", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"Machine5", @"name",
                              @"MachinePassword", @"password",
                              @"192.168.1.3", @"public_ip",
                              [NSNumber numberWithFloat:40.2f], @"temperature",
                              nil];
    NSDictionary *machine6 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"m6", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"Machine6", @"name",
                              @"MachinePassword", @"password",
                              @"192.168.1.3", @"public_ip",
                              [NSNumber numberWithFloat:40.2f], @"temperature",
                              nil];
    NSDictionary *machine7 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"m7", @"machineid",
                              [NSNumber numberWithInt:0], @"admin_only",
                              [NSNumber numberWithInt:1], @"allow_connect",
                              [NSNumber numberWithInt:1], @"available_sensor",
                              @"192.168.1.3", @"machine_ip",
                              @"Machine7", @"name",
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
    [delegate drinkServerGotMachine:machine2];
    [delegate drinkServerGotMachine:machine3];
    [delegate drinkServerGotMachine:machine4];
    [delegate drinkServerGotMachine:machine5];
    [delegate drinkServerGotMachine:machine6];
    [delegate drinkServerGotMachine:machine7];

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

-(void)timerFired:(NSTimer*)theTimer
{
    NSNumber *num = [user objectForKey:@"credits"];
    uint32_t credits = [num intValue];
    credits = (credits + 50) % 300;
    [user setValue:[NSNumber numberWithInt:credits] forKey:@"credits"];
    [delegate drinkServerGotCurrentUser:user];
    
    NSString *name = [machine objectForKey:@"name"];
    if ([name isEqualToString:@"MachineName"])
    {
        name = @"Mach Name 2";
    }
    else
    {
        name = @"MachineName";
    }
    [machine setValue:name forKey:@"name"];
    [delegate drinkServerGotMachine:machine];
}

-(void)close
{
    [timer invalidate];
    [delegate drinkServerDidDisconnect];
}

@end
