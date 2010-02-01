//
//  DrinkConnection.h
//  libdrink
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkConnectionInterface.h"
#import "DrinkUser.h"

@interface DrinkConnection : NSObject {
	DrinkConnectionInterface *conn;
	BOOL connected;

	NSMutableArray *machines;
    DrinkUser *currentUser;
}

@property (readonly) BOOL connected;
@property (readonly) NSArray *machines;
@property (readonly) DrinkUser *currentUser;

-(id)initWithURL:(NSURL*)url;

-(void)connect;
-(void)close;

@end

@interface DrinkConnection (DrinkConnectionInterfaceDelegate)

-(void)drinkServerDidConnect;
-(void)drinkServerDidDisconnect;
-(void)drinkServerGotMachine:(NSDictionary*)machine;
-(void)drinkServerMachineRemoved:(NSString*)machine;
-(void)drinkServerGotCurrentUser:(NSDictionary*)user;

@end