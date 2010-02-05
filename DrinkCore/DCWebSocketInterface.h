//
//  DCWebSocketInterface.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCConnection.h"
#import "DCConnectionInterface.h"
#import "AsyncSocket.h"

@interface DCWebSocketInterface : DCConnectionInterface {
	NSURL *url;
    
	AsyncSocket *sock;
	
	NSData *websocket_terminator;
}

-(void)connect;
-(void)close;

@end
