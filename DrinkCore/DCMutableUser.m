//
//  DCMutableUser.m
//  DrinkCore
//
//  Created by Dan Willemsen on 2/2/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCMutableUser.h"


@implementation DCMutableUser

+(BOOL)accessInstanceVariablesDirectly
{
	return NO;
}

-(id)initWithUserName:(DCUser*)user
{
    if ((self = [super init]))
    {
        serverUser = [user retain];
        originalUser = [user copy];
    }
    
    return self;
}

@synthesize serverUser;
@synthesize originalUser;

@end
