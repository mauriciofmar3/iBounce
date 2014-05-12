//
//  MovingObject.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/11/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovingObject : NSObject

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float xspeed;
@property (nonatomic) float yspeed;

-(void)update;
-(void)shake;
-(CGRect)bounds;

-(void)hitTopWithForce:(int)force;
-(void)hitRightWithForce:(int)force;
-(void)hitBottomWithForce:(int)force;
-(void)hitLeftWithForce:(int)force;

@end