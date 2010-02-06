//
//  MachineBriefController.m
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "MachineBriefController.h"
#import "DWImageCache.h"

@implementation MachineBriefController

@synthesize machine;
@synthesize imageView, nameLabel;

-(id)initWithMachine:(DCMachine*)m
{
    if ((self = [super initWithNibName:@"MachineBrief" bundle:nil]))
    {
        machine = m;
    }
    
    return self;
}

// TODO: deal with observers in viewWillAppear / viewWillDisappear?

-(void)viewDidLoad
{
    [machine addObserver:self
              forKeyPath:@"name"
                 options:NSKeyValueObservingOptionNew
                 context:nil];
    [nameLabel setText:[machine name]];

    [DWImageCache cacheImageFromURL:[NSURL URLWithString:@"http://www.csh.rit.edu/~dan/drink_machine.jpg"]
                                                 forView:imageView];
}

-(void)viewDidUnload
{
    [machine removeObserver:self forKeyPath:@"name"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"])
    {
        [nameLabel setText:[change objectForKey:NSKeyValueChangeNewKey]];
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
