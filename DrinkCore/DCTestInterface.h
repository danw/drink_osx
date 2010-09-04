//
//  DCTestInterface.h
//  DrinkCore
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCConnection.h"

@interface DCTestInterface : DCConnectionInterface {
    NSTimer *timer;
    NSDictionary *user, *machine;
}

-(void)connect;
-(void)timerFired:(NSTimer*)theTimer;
-(void)close;

@end
