//
//  DCMutableMachine.h
//  DrinkCore
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCMachine.h"

@interface DCMutableMachine : DCMachine {
    DCMachine *serverMachine;
    DCMachine *originalMachine;
}

-(id)initWithMachine:(DCMachine*)m;

@property (readonly) DCMachine *serverMachine;
@property (readonly) DCMachine *originalMachine;

-(void)setMachineID:(NSString*)mid;
-(void)setAdminOnly:(BOOL)ao;
-(void)setAllowConnect:(BOOL)ac;
-(void)setAvailableSensor:(BOOL)as;
-(void)setMachineIP:(NSString*)mip;
-(void)setName:(NSString*)n;
-(void)setPassword:(NSString*)p;
-(void)setPublicIP:(NSString*)pip;
-(void)setTemperature:(NSNumber*)t;

@end
