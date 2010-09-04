//
//  MachineEditViewController.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/6/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCMachine.h"

@interface MachineEditViewController : UIViewController <UITableViewDataSource> {
    DCMachine *machine;
    IBOutlet UITableView *tableView;
}

-(id)initWithMachine:(DCMachine*)m;

@end
