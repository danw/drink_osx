//
//  iPadDrinkAppDelegate.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/3/10.
//  Copyright Dan Willemsen 2010. All rights reserved.
//

#import "iPadDrinkAppDelegate.h"
#import "DCMachine.h"
#import "MachinePickerController.h"

@implementation iPadDrinkAppDelegate

@synthesize window, navControl;
@synthesize conn;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{	
    NSURL *url = [NSURL URLWithString:@"test://dan@192.168.1.3:42080"];
    conn = [[DCConnection alloc] initWithURL:url];
    
    [conn addObserver:self
           forKeyPath:@"currentUser"
              options:0
              context:nil];
    
    [conn connect];
        
    [window addSubview:[navControl view]];
    [window makeKeyAndVisible];
	
	return YES;
}

-(void)updateTitle:(UIViewController*)vc
{
    if (conn.connected)
    {
        //        NSString *newTitle = [NSString stringWithFormat:@"User: %@ Credits: %@", [[conn currentUser] username], [[conn currentUser] credits]];
        //        [[navControl visibleViewController] setTitle:newTitle];
    }
    else
    {
        //        [[navControl visibleViewController] setTitle:@"Disconnected"];
    }

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentUser"])
    {
        [[conn currentUser] addObserver:self
                             forKeyPath:@"username" 
                                options:0
                                context:nil];
        [[conn currentUser] addObserver:self
                             forKeyPath:@"credits" 
                                options:0
                                context:nil];
        [self updateTitle:[navControl visibleViewController]];
    }
    else if ([keyPath isEqualToString:@"username"])
    {
        [self updateTitle:[navControl visibleViewController]];
    }
    else if ([keyPath isEqualToString:@"credits"])
    {
        [self updateTitle:[navControl visibleViewController]];
    }
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self updateTitle:viewController];
}

- (void)dealloc {
    [navControl release];
    [conn release];
    [window release];
    [super dealloc];
}

@end
