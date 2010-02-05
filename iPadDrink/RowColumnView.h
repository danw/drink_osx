//
//  RowColumnView.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RowColumnView_ROWS 1
#define RowColumnView_COLUMNS 2

@interface RowColumnView : UIView {
    NSUInteger mode;
}

-(void)setMode:(NSUInteger)m;

@end
