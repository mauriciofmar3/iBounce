//
//  Ball.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/7/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovingObject.h"

@interface Ball : MovingObject

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float radius;
@property (nonatomic) float xspeed;
@property (nonatomic) float yspeed;
@property (nonatomic) float maximum_speed;

-(id)initWithRadius:(int)r andX:(int)x andY:(int)y;
-(void)update;

@end