//
//  DrinkConnectionInterface.m
//  libdrink
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import "DrinkConnectionInterface.h"


@implementation DrinkConnectionInterface

-(id)initWithURL:(NSURL*)url
{
	[self doesNotRecognizeSelector:_cmd];
	[self release];
	return nil;
}

-(void)connect
{
	[self doesNotRecognizeSelector:_cmd];
}

-(void)close
{
	[self doesNotRecognizeSelector:_cmd];
}

@end
