//
//  DCMachine.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>


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
@property (readwrite) BOOL adminOnly;
@property (readwrite) BOOL allowConnect;
@property (readwrite) BOOL availableSensor;
@property (readonly) BOOL connected;
@property (readwrite, retain) NSString *machineIP;
@property (readwrite, retain) NSString *name;
@property (readwrite, retain) NSString *password;
@property (readwrite, retain) NSString *publicIP;
@property (readwrite, retain) NSNumber *temperature;

-(id)initWithServerData:(NSDictionary*)data;
-(void)updateWithServerData:(NSDictionary*)data;

@end
