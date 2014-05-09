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

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int radius;
@property (nonatomic) int xspeed;
@property (nonatomic) int yspeed;

@property (nonatomic) float angle;

-(id)initWithRadius:(int)r andX:(int)x andY:(int)y;
-(void)update;
-(void)shake;

@end