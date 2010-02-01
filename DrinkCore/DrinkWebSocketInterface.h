//
//  DrinkWebSocketInterface.h
//  libdrink
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkConnection.h"
#import "DrinkConnectionInterface.h"
#import "AsyncSocket.h"

@interface DrinkWebSocketInterface : DrinkConnectionInterface {
	NSURL *url;
	DrinkConnection *delegate;

	AsyncSocket *sock;
	
	NSData *websocket_terminator;
}

-(id)initWithURL:(NSURL*)url delegate:(DrinkConnection*)d;
-(void)connect;
-(void)close;

@end
