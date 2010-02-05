//
//  DCConnectionInterface.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DCConnectionInterfaceDelegate

-(void)drinkServerDidConnect;
-(void)drinkServerDidDisconnect;
-(void)drinkServerGotMachine:(NSDictionary*)machine;
-(void)drinkServerMachineRemoved:(NSString*)machine;
-(void)drinkServerGotCurrentUser:(NSDictionary*)user;

@end

@interface DCConnectionInterface : NSObject {
    id <DCConnectionInterfaceDelegate> delegate;
}

-(id)initWithURL:(NSURL*)url delegate:(id <DCConnectionInterfaceDelegate>)d;
-(void)connect;
-(void)close;

@end