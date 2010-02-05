//
//  DCMutableUser.h
//  DrinkCore
//
//  Created by Dan Willemsen on 2/2/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DCUser.h"

@interface DCMutableUser : DCUser {
    DCUser *originalUser;
    DCUser *serverUser;
}

-(id)initWithUser:(DCUser*)user;

@property (readonly) DCUser *originalUser;
@property (readonly) DCUser *serverUser;

@end
