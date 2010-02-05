//
//  MachinePickerController.h
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DCConnection.h"
#import "RowColumnView.h"

@interface MachinePickerController : UIViewController {
    NSMutableArray *briefs;
    DCConnection *conn;
    RowColumnView *contentView;
}

@property (nonatomic,retain) IBOutlet RowColumnView *contentView;

-(void)addMachineBrief:(NSUInteger)i;

@end
