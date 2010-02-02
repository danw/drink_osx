//
//  DCUser.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/31/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DCUser : NSObject {
    NSString *username;
    NSNumber *credits;
    BOOL admin;
    NSMutableArray *ibuttons;
}

@property (readonly) NSString *username;
@property (readwrite, retain) NSNumber *credits;
@property (readwrite, assign) BOOL admin;
@property (readonly) NSArray *ibuttons;

-(id)initWithServerData:(NSDictionary*)data;
-(void)updateWithServerData:(NSDictionary*)data;

@end
