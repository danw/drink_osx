//
//  DrinkTestInterface.h
//  DrinkOSX
//
//  Created by Dan Willemsen on 2/1/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DrinkConnection.h"

@interface DrinkTestInterface : DrinkConnectionInterface {
    DrinkConnection *delegate;
}

-(id)initWithURL:(NSURL *)url delegate:(DrinkConnection*)delegate;

-(void)connect;
-(void)close;

@end
