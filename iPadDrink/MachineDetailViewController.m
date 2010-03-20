    //
//  MachineDetailViewController.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/6/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "MachineDetailViewController.h"
#import "DWCachedImageView.h"

@implementation MachineDetailViewController

@synthesize labelView, imageView;

- (id)initWithMachine:(DCMachine*)m
{
    if (self = [super initWithNibName:@"MachineDetail" bundle:nil])
    {
        machine = m;
    }
    return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
        
    [imageView setImageURL:[NSURL URLWithString:@"http://www.csh.rit.edu/~dan/drink_machine.jpg"]];
    
    [machine addObserver:self
              forKeyPath:@"name"
                 options:0
                 context:nil];
    
    self.title = [machine name];
    [labelView setText:[machine name]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"])
    {
        [labelView setText:[machine name]];
        self.title = [machine name];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
