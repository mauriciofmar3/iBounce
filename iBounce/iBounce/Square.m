//
//  Square.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/13/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "Square.h"

@implementation Square

-(id)initWithWidth:(int)width andX:(int)x andY:(int)y {
    if([super self]) {
        self.width = width;
        self.x = x;
        self.y = y;
        self.angle = M_PI / 4;
        self.xspeed = 2.0;
        self.yspeed = 2.0;
        
        self.maximum_speed = 30;
        self.speed_decay = 0.998;
    }
    return self;
}

-(void)update {
    self.xspeed = MIN(self.xspeed * self.speed_decay, self.maximum_speed);
    self.yspeed = MIN(self.yspeed * self.speed_decay, self.maximum_speed);
    self.x += self.xspeed;
    self.y += self.yspeed;
    self.angle += M_PI/64;
}

-(void)hitTopWithForce:(int)force {
    self.yspeed *= force;
    self.yspeed = fabsf(self.yspeed);
}

-(void)hitBottomWithForce:(int)force {
    self.yspeed *= force;
    self.yspeed = -1 * fabsf(self.yspeed);
}

-(void)hitRightWithForce:(int)force {
    self.xspeed *= force;
    self.xspeed = -1 * fabsf(self.xspeed);
}

-(void)hitLeftWithForce:(int)force {
    self.xspeed *= force;
    self.xspeed = fabsf(self.xspeed);
}

-(CGRect)bounds {
    return CGRectMake(self.x - self.width, self.y - self.width,
                      self.width * 2, self.width * 2);
}

-(CGPoint*)points:(CGPoint*)points {
    NSLog(@"%f %f %f", self.x, self.y, self.yspeed);
    for(int i = 0; i < 4; ++i) {
        float angle_offset = self.angle + (M_PI/2) * i;
        points[i] = CGPointMake(self.x + self.width * sinf(angle_offset), self.y + self.width * cosf(angle_offset));
        
    }
    return points;
}

@end
