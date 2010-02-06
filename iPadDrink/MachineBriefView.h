//
//  MachineBriefView.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MachineBriefView : UIView {
    UIImageView *imageView;
    UIScrollView *scrollView;
    UILabel *labelView;
}

@property (nonatomic,retain) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) IBOutlet UILabel *labelView;

@end
