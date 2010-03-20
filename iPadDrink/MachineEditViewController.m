//
//  MachineEditViewController.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/6/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "MachineEditViewController.h"


@implementation MachineEditViewController

-(id)initWithMachine:(DCMachine*)m
{
    if (self = [super initWithNibName:@"MachineEdit" bundle:nil])
    {
        machine = m;
    }
    return self;
}

#pragma mark UIViewController functions

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
    
    [machine addObserver:self
              forKeyPath:@"name"
                 options:0 
                 context:nil];
    [machine addObserver:self
              forKeyPath:@"password"
                 options:0
                 context:nil];
    [machine addObserver:self
              forKeyPath:@"publicIP"
                 options:0
                 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"])
    {
    }
    else if ([keyPath isEqualToString:@"password"])
    {
    }
    else if ([keyPath isEqualToString:@"publicIP"])
    {
    }

}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
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

#pragma mark Popover functions
-(CGSize)contentSizeForViewInPopoverView
{
    return CGSizeMake(320, 480);
}

#pragma mark Table View Datasource functions

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (BOOL) tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath
{
    return NO;
}

- (BOOL) tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath
{
    return NO;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId] autorelease];
    }
    
    if ([indexPath row] == 0)
    {
        cell.textLabel.text = @"Name";
        cell.detailTextLabel.text = machine.name;
    }
    else if ([indexPath row] == 1)
    {
        cell.textLabel.text = @"Password";
        cell.detailTextLabel.text = machine.password;
    }
    else if ([indexPath row] == 2)
    {
        cell.textLabel.text = @"Public IP";
        cell.detailTextLabel.text = machine.publicIP;
    }
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"ID: %@", machine.machineID];
}

- (NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

@end
