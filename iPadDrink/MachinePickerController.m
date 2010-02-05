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
    
    contentView.backgroundColor = [UIColor redColor];
    
    for (i = 0; i < [[conn machines] count]; i++)
    {
        [self addMachineBrief:i];
    }
}

-(void)viewDidUnload
{
    [conn removeObserver:self forKeyPath:@"machines"];
}

-(void)addMachineBrief:(NSUInteger)i
{
    NSUInteger a;
    
    if (i < [briefs count])
    {
        return;
    }
    
    DCMachine *m = [[conn machines] objectAtIndex:i];
    MachineBriefController *controller = [[MachineBriefController alloc] initWithMachine:m];
    
    [controller view].backgroundColor = [UIColor blueColor];
    
    [briefs insertObject:controller atIndex:i];

    [contentView addSubview:[controller view]];
    [contentView setBounds:CGRectMake(0, 0, 768, 60 + 270 * i)];
    for (a = 0; a <= i; a++)
    {
        [[[briefs objectAtIndex:a] view] setFrame:CGRectMake(30, 30 + (270 * a), 600, 240)];
    }
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
