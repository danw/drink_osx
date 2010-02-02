//
//  DCConnectionInterface.h
//  DrinkCore
//
//  Created by Dan Willemsen on 1/28/10.
//  Copyright 2010 Dan Willemsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCConnectionInterface : NSObject {

}

-(id)initWithURL:(NSURL*)url;
-(void)connect;
-(void)close;

@end