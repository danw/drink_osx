//
//  RowColumnView.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "RowColumnView.h"


@implementation RowColumnView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
    NSUInteger i;
    CGRect f;
    CGRect b = self.bounds;
    NSUInteger horizontalPadding = 30;
    NSUInteger verticalPadding = 30;
    
    if (mode == RowColumnView_ROWS)
    {
        for (i = 0; i < [[self subviews] count]; i++)
        {
            f = CGRectMake(horizontalPadding,
                           verticalPadding + ((verticalPadding + 240)*i),
                           CGRectGetWidth(b) - 2*horizontalPadding,
                           240);
            [[[self subviews] objectAtIndex:i] setFrame:f];
        }
    }
    else if (mode == RowColumnView_COLUMNS)
    {
        for (i = 0; i < [[self subviews] count]; i++)
        {
            f = CGRectMake(horizontalPadding + ((horizontalPadding + 240) * i), 
                           verticalPadding, 
                           240, 
                           CGRectGetHeight(b) - verticalPadding*2);
            [[[self subviews] objectAtIndex:i] setFrame:f];
        }
    }
    else
    {
        NSLog(@"Unknown mode for RowColumnView");
    }


}

-(void)setMode:(NSUInteger)m
{
    mode = m;
    [self setNeedsLayout];
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

@end
