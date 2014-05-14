//
//  Square.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/13/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "MovingObject.h"

@interface Square : MovingObject

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float width;
@property (nonatomic) float xspeed;
@property (nonatomic) float yspeed;
@property (nonatomic) float spin_speed;
@property (nonatomic) float maximum_speed;

-(id)initWithWidth:(int)width andX:(int)x andY:(int)y;
-(void)update;

@end
