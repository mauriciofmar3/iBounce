//
//  Ball.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/7/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ball : NSObject

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int radius;
@property (nonatomic) int speed;
@property (nonatomic) float angle;

-(id)initWithRadius:(int)r andX:(int)x andY:(int)y;
-(void)update;

@end