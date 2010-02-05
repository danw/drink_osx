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

@interface DCConnection : NSObject < DCConnectionInterfaceDelegate > {
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