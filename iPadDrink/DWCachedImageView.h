//
//  DWImageCache.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DWCachedImageView : UIImageView
{
    NSURL *url;
}

-(void)setImageURL:(NSURL*)u;

@end