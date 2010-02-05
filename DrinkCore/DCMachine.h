//
//  DCMachine.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCMutableMachine;

@interface DCMachine : NSObject {
	NSString *machineID;
	BOOL adminOnly;
	BOOL allowConnect;
	BOOL availableSensor;
	BOOL connected;
	NSString *machineIP;
	NSString *name;
	NSString *password;
	NSString *publicIP;
	NSNumber *temperature;
}

@property (readonly) NSString *machineID;
@property (readonly) BOOL adminOnly;
@property (readonly) BOOL allowConnect;
@property (readonly) BOOL availableSensor;
@property (readonly) BOOL connected;
@property (readonly) NSString *machineIP;
@property (readonly) NSString *name;
@property (readonly) NSString *password;
@property (readonly) NSString *publicIP;
@property (readonly) NSNumber *temperature;

-(id)initWithServerData:(NSDictionary*)data;
-(void)updateWithServerData:(NSDictionary*)data;

-(DCMutableMachine*)mutableCopy;

@end
