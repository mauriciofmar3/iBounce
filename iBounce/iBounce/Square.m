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
    float speed = sqrtf(self.yspeed*self.yspeed + self.xspeed*self.xspeed);
    self.yspeed = speed*sinf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
    self.xspeed = -1 * speed*cosf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
}

-(void)hitBottomWithForce:(int)force {
    self.yspeed *= force;
    self.yspeed = -1 * fabsf(self.yspeed);
    float speed = sqrtf(self.yspeed*self.yspeed + self.xspeed*self.xspeed);
    self.yspeed = -1 * speed*sinf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
    self.xspeed = speed*cosf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
}

-(void)hitRightWithForce:(int)force {
    self.xspeed *= force;
    self.xspeed = -1 * fabsf(self.xspeed);
    float speed = sqrtf(self.yspeed*self.yspeed + self.xspeed*self.xspeed);
    self.yspeed = -1 * speed*cosf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
    self.xspeed = -1 * speed*sinf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
}

-(void)hitLeftWithForce:(int)force {
    self.xspeed *= force;
    self.xspeed = fabsf(self.xspeed);
    float speed = sqrtf(self.yspeed*self.yspeed + self.xspeed*self.xspeed);
    self.yspeed = speed*cosf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
    self.xspeed = speed*sinf((fmod(self.angle+M_PI/4, M_PI/2)+M_PI/4));
}

-(CGRect)bounds {
    float distance = self.width * sinf(fmod(self.angle + M_PI/4, M_PI/2) + M_PI/4);
    return CGRectMake(self.x - distance, self.y - distance,
                      distance * 2, distance * 2);
}

-(CGPoint*)points:(CGPoint*)points {
    for(int i = 0; i < 4; ++i) {
        float angle_offset = self.angle + (M_PI/2) * i;
        points[i] = CGPointMake(self.x + self.width * sinf(angle_offset), self.y + self.width * cosf(angle_offset));
        
    }
    return points;
}

@end
