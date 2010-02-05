//
//  MachinePickerController.h
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DCConnection.h"

@interface MachinePickerController : UIViewController {
    NSMutableArray *briefs;
    DCConnection *conn;
    UIView *contentView;
}

@property (nonatomic,retain) IBOutlet UIView *contentView;

-(void)addMachineBrief:(NSUInteger)i;

@end
