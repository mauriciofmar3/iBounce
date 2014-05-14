//
//  Square.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/13/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "Square.h"

@implementation Square

float maximum_speed = 30;
float speed_decay = 0.998;

-(id)initWithWidth:(int)width andX:(int)x andY:(int)y {
    if([super self]) {
        self.width = width;
        self.x = x;
        self.y = y;
        self.xspeed = 2.0;
        self.yspeed = 2.0;
    }
    return self;
}

-(void)update {
    self.xspeed = MIN(self.xspeed * speed_decay, maximum_speed);
    self.yspeed = MIN(self.yspeed * speed_decay, maximum_speed);
    self.x += self.xspeed;
    self.y += self.yspeed;
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

-(void)shake {
    if(self.x > 150)
        self.xspeed += 1;
}

-(CGRect)bounds {
    return CGRectMake(self.x - self.width, self.y - self.width,
                      self.width * 2, self.width * 2);
}
@end
