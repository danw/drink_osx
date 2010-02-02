//
//  DrinkCLI.m
//  DrinkCLI
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DrinkCore/DCConnection.h>
#import <DrinkCore/DCMachine.h>

@interface Watcher : NSObject
{}

-(id)initWithConnection:(DCConnection*)conn;
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context;

@end

@implementation Watcher

-(id)initWithConnection:(DCConnection*)conn
{
	if ((self = [super init]))
	{
		[conn addObserver:self 
			   forKeyPath:@"machines" 
				  options:NSKeyValueObservingOptionNew
				  context:nil];
		[conn addObserver:self
			   forKeyPath:@"connected" 
				  options:NSKeyValueObservingOptionNew
				  context:nil];
        [conn addObserver:self
               forKeyPath:@"currentUser"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
	}
	
	return self;
}

-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
	if ([keyPath isEqualToString:@"machines"])
    {
        if ([[change objectForKey:NSKeyValueChangeKindKey] intValue] == NSKeyValueChangeInsertion)
        {
            NSArray *machineArr = [change objectForKey:NSKeyValueChangeNewKey];
            for(DCMachine *machine in machineArr)
            {
                [machine addObserver:self
                          forKeyPath:@"name"
                             options:NSKeyValueObservingOptionNew 
                             context:nil];
                NSLog(@"Got new machine: %@", machine);
            }
        }
    }
    else if ([keyPath isEqualToString:@"currentUser"])
    {
        DCUser *user = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"Got current user: %@", user);
    }
    else if ([keyPath isEqualToString:@"connected"])
    {
        id connected = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"Got connected: %@", connected);
    }
    else
    {
       	NSLog(@"Got change for %@(%@): %@", object, keyPath, change);
    }

}

@end


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSURL *url = [NSURL URLWithString:@"ws://dan@192.168.1.3:42080"];
	DCConnection *conn = [[DCConnection alloc] initWithURL:url];
	[[Watcher alloc] initWithConnection:conn];
	[conn connect];
	
	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	[runLoop run];
	
    [pool drain];
    return 0;
}