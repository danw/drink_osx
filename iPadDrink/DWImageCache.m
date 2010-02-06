//
//  DWImageCache.m
//  iPadDrink
//
//  Created by Dan Willemsen on 2/5/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "DWImageCache.h"

static DWImageCache *sharedInstance = nil;

@implementation DWImageCache

#pragma mark Singleton Behaviour
+(DWImageCache*)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
            sharedInstance = [[DWImageCache alloc] init];
    }
    return sharedInstance;
}

+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

-(id)copyWithZone:(NSZone *)zone
{
    return self;
}

-(id)retain
{
    return self;
}

-(void)release
{
    // nothing
}

-(id)autorelease
{
    return self;
}

#pragma mark Convience Methods
+(void)cacheImageFromURL:(NSURL*)url forView:(UIImageView*)view
{
    [[DWImageCache sharedInstance] cacheImageFromURL:(NSURL*)url forView:(UIImageView*)view];
}

#pragma mark Actual workers

-(void)cacheImageFromURL:(NSURL*)url forView:(UIImageView*)view
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    
    view.image = img;
    [img release];
}

@end
