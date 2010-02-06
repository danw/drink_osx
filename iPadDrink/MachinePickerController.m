//
//  MachinePickerController.m
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "iPadDrinkAppDelegate.h"
#import "MachinePickerController.h"
#import "DCMachine.h"
#import "MachineBriefController.h"

@implementation MachinePickerController

@synthesize contentView;

-(void)viewDidLoad
{
    NSUInteger i;
 
    briefs = [NSMutableArray array];
 
    conn = [(iPadDrinkAppDelegate*)[[UIApplication sharedApplication] delegate] conn];
    
    [conn addObserver:self
           forKeyPath:@"machines"
              options:NSKeyValueObservingOptionNew
              context:nil];
    
    if (UIInterfaceOrientationIsPortrait([self interfaceOrientation]))
        [contentView setMode:RowColumnView_ROWS];
    else
        [contentView setMode:RowColumnView_COLUMNS];
    
    for (i = 0; i < [[conn machines] count]; i++)
    {
        [self addMachineBrief:i];
    }
}

-(void)viewDidUnload
{
    [conn removeObserver:self forKeyPath:@"machines"];
    for (MachineBriefController *mbc in briefs)
        [mbc release];
    [briefs release];
    [contentView release];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape([self interfaceOrientation]))
    {
        [contentView setMode:RowColumnView_COLUMNS];
    }
    else 
    {
        [contentView setMode:RowColumnView_ROWS];
    }
    [contentView setNeedsLayout];
    
    [(UIScrollView*)[self view] setContentSize:[contentView frame].size];    
}

-(void)addMachineBrief:(NSUInteger)i
{
    if (i < [briefs count])
    {
        return;
    }
    
    DCMachine *m = [[conn machines] objectAtIndex:i];
    MachineBriefController *controller = [[MachineBriefController alloc] initWithMachine:m];
    
    [controller view].backgroundColor = [UIColor blueColor];
    
    [briefs insertObject:controller atIndex:i];

    [contentView addSubview:[controller view]];
    [(UIScrollView*)[self view] setContentSize:[contentView frame].size];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"machines"])
    {
        NSUInteger i = [(NSIndexSet*)[change objectForKey:NSKeyValueChangeIndexesKey] firstIndex];
        
        [self addMachineBrief:i];
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}



@end
