//
//  MachineBriefController.m
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "MachineBriefController.h"
#import "iPadDrinkAppDelegate.h"
#import "MachineDetailViewController.h"
#import "MachineEditViewController.h"

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

    [imageView setImageURL:[NSURL URLWithString:@"http://www.csh.rit.edu/~dan/drink_machine.jpg"]];
    
    currentPopover = nil;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    tap.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tap];
    [tap release];
    
    UILongPressGestureRecognizer *long_tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongTap)];
    [imageView addGestureRecognizer:long_tap];
    [long_tap release];
}

-(void)handleTap
{
    iPadDrinkAppDelegate *d = (iPadDrinkAppDelegate*)[[UIApplication sharedApplication] delegate];
    MachineDetailViewController *vc = [[MachineDetailViewController alloc] initWithMachine:machine];
    
    NSLog(@"handleTap");
    
    [[d navControl] pushViewController:vc animated:YES];
    [vc release];
}

-(void)handleLongTap
{
    if (currentPopover != nil && [currentPopover isPopoverVisible]) return;
    
    MachineEditViewController *vc = [[MachineEditViewController alloc] initWithMachine:machine];
    
    if (currentPopover == nil)
        currentPopover = [[UIPopoverController alloc] initWithContentViewController:vc];
    else 
        [currentPopover setContentViewController:vc];
    
//    currentPopover.delegate = self;
    [currentPopover presentPopoverFromRect:[imageView frame]
                                    inView:[self view]
                  permittedArrowDirections:UIPopoverArrowDirectionAny
                                  animated:YES];
    [vc release];
}

-(void)viewDidUnload
{
    [machine removeObserver:self forKeyPath:@"name"];
    [currentPopover release];
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
