//
//  RowColumnView.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/4/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "RowColumnView.h"

#define PADDING 30
#define ITEMLENGTH 240

@implementation RowColumnView

-(void)awakeFromNib
{
    mode = RowColumnView_ROWS;
    length = PADDING;
}

- (void)didAddSubview:(UIView *)view
{
    length += PADDING + ITEMLENGTH;
    NSLog(@"didAddSubview: %u", length);
    
    [self setMode:mode];
}

- (void)layoutSubviews {
    NSUInteger i;
    CGRect f;
    CGRect b = self.bounds;
    
    if (mode == RowColumnView_ROWS)
    {
        for (i = 0; i < [[self subviews] count]; i++)
        {
            f = CGRectMake(PADDING,
                           PADDING + (PADDING + ITEMLENGTH) * i,
                           CGRectGetWidth(b) - 2 * PADDING,
                           ITEMLENGTH);
            [[[self subviews] objectAtIndex:i] setFrame:f];
        }
    }
    else if (mode == RowColumnView_COLUMNS)
    {
        for (i = 0; i < [[self subviews] count]; i++)
        {
            f = CGRectMake(PADDING + (PADDING + ITEMLENGTH) * i,
                           PADDING, 
                           ITEMLENGTH, 
                           CGRectGetHeight(b) - PADDING * 2);
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
    CGRect parentBounds = [[self superview] bounds];
    mode = m;
    
    if (mode == RowColumnView_ROWS)
    {
        [self setFrame:CGRectMake(0, 0, CGRectGetWidth(parentBounds), length)];
    }
    else if (mode == RowColumnView_COLUMNS)
    {
        [self setFrame:CGRectMake(0, 0, length, CGRectGetHeight(parentBounds))];
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

@end
