//
//  iPadDrinkAppDelegate.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/3/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCConnection.h"

@interface iPadDrinkAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate> {
    UIWindow *window;
    DCConnection *conn;
    
    UINavigationController *navControl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navControl;
@property (nonatomic, retain) DCConnection *conn;

@end

