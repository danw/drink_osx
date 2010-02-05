//
//  DCUser.m
//  DrinkCore
//
//  Created by Dan Willemsen on 1/31/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DCUser.h"
#import "DCMutableUser.h"

@implementation DCUser

-(id)initWithServerData:(NSDictionary*)data
{
    if ((self = [super init]))
    {
        username = [data objectForKey:@"username"];
        ibuttons = [NSMutableArray array];
        [self updateWithServerData:data];
    }
    
    return self;
}

@synthesize username;
@synthesize credits;
@synthesize admin;
@synthesize ibuttons;

-(void)updateWithServerData:(NSDictionary*)data
{
    [self setCredits:[data objectForKey:@"credits"]];
    [self setAdmin:[[data objectForKey:@"admin"] boolValue]];
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"<DCUser %@%@ %@ credits>", 
            username, 
            admin ? @"(admin)" : @"", 
            credits];
}

-(DCMutableUser*)mutableCopy
{
    return [[DCMutableUser alloc] initWithUser:self];
}

@end
