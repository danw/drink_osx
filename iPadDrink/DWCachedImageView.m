//
//  DWImageCache.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DWCachedImageView.h"

static NSMutableDictionary* images = nil;

@implementation DWCachedImageView

-(void)setImageURL:(NSURL*)u
{
    NSData *data;
    UIImage *img;
    
    @synchronized(images)
    {
        if (images == nil)
            images = [[NSMutableDictionary dictionary] retain];
    }
    
    [url retain];
    url = u;
    
    NSString *str = [url absoluteString];
    
    img = [images objectForKey:str];
    
    if (img == nil)
    {
        NSLog(@"Loading new image");
        data = [NSData dataWithContentsOfURL:url];
        img = [[UIImage alloc] initWithData:data];
        [images setValue:img forKey:str];
    }
    else
    {
        NSLog(@"Loading cached image");
    }
    
    [self setImage:img];
}

@end