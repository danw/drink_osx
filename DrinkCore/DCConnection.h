//
//  DCConnection.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCConnectionInterface.h"
#import "DCUser.h"

@interface DCConnection : NSObject {
	DCConnectionInterface *conn;
	BOOL connected;

	NSMutableArray *machines;
    DCUser *currentUser;
}

@property (readonly) BOOL connected;
@property (readonly) NSArray *machines;
@property (readonly) DCUser *currentUser;

-(id)initWithURL:(NSURL*)url;

-(void)connect;
-(void)close;

@end

@interface DCConnection (DrinkConnectionInterfaceDelegate)

-(void)drinkServerDidConnect;
-(void)drinkServerDidDisconnect;
-(void)drinkServerGotMachine:(NSDictionary*)machine;
-(void)drinkServerMachineRemoved:(NSString*)machine;
-(void)drinkServerGotCurrentUser:(NSDictionary*)user;

@end