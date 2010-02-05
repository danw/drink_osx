//
//  MachineBriefController.h
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DCMachine.h"

@interface MachineBriefController : UIViewController {
    UIImageView *imageView;
    UILabel *nameLabel;
    DCMachine *machine;
}

@property (nonatomic,retain) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) IBOutlet UILabel *nameLabel;
@property (nonatomic,retain) DCMachine *machine;

-(id)initWithMachine:(DCMachine*)m;

@end
