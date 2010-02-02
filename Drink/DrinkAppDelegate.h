//
//  DrinkAppDelegate.h
//  DrinkOSX
//
//  Created by Dan Willemsen on 1/31/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DrinkCore/DCConnection.h>

@interface DrinkAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    DCConnection *conn;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet DCConnection *conn;

@end
