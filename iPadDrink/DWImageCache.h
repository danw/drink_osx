//
//  DWImageCache.h
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DWImageCache : NSObject {

}

+(void)cacheImageFromURL:(NSURL*)url forView:(UIImageView*)view;
-(void)cacheImageFromURL:(NSURL*)url forView:(UIImageView*)view;

@end
