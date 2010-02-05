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
    DCConnection *delegate;
}

-(id)initWithURL:(NSURL *)url delegate:(DCConnection*)delegate;

-(void)connect;
-(void)close;

@end
