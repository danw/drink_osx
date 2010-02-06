//
//  MachineBriefView.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "MachineBriefView.h"


@implementation MachineBriefView

@synthesize imageView, labelView, scrollView;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    CGRect b = [self bounds];
    
    [imageView setFrame:CGRectMake(0, 0, 240, 240)];
    [labelView setFrame:CGRectMake(0, 0, 240, CGRectGetHeight([labelView frame]))];
    
    if (CGRectGetWidth(b) == 240)
    {
        [scrollView setFrame:CGRectMake(0, 240, 240, CGRectGetHeight(b) - 240)];
    }
    else if (CGRectGetHeight(b) == 240)
    {
        [scrollView setFrame:CGRectMake(240, 0, CGRectGetWidth(b) - 240, 240)];
    }
    else
    {
        NSLog(@"Bad!");
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}

- (BOOL)autoresizesSubviews {
    return NO;
}

@end
