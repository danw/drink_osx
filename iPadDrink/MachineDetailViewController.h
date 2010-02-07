//
//  MachineDetailViewController.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/6/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCMachine.h"
#import "DWCachedImageView.h"

@interface MachineDetailViewController : UIViewController {
    DCMachine *machine;
    DWCachedImageView *imageView;
    UILabel *labelView;
}

@property (nonatomic,retain) IBOutlet DWCachedImageView *imageView;
@property (nonatomic,retain) IBOutlet UILabel *labelView;

@end
