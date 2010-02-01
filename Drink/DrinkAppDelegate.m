//
//  DrinkAppDelegate.m
//  DrinkOSX
//
//  Created by Dan Willemsen on 1/31/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DrinkAppDelegate.h"


@implementation DrinkAppDelegate

@synthesize window;
@synthesize conn;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSURL *url = [NSURL URLWithString:@"ws://dan@192.168.1.3:42080"];
    [self willChangeValueForKey:@"conn"];
    conn = [[DrinkConnection alloc] initWithURL:url];
    [self didChangeValueForKey:@"conn"];
    [conn connect];
}

@end
