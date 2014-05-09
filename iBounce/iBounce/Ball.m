//
//  Ball.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/7/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "Ball.h"

@implementation Ball


-(id)initWithRadius:(int)r andX:(int)x andY:(int)y{
    if([super self]) {
        self.radius = r;
        self.x = x;
        self.y = y;
        self.xspeed = 3;
        self.yspeed = 2;
    }
    return self;
}

-(void)update {
    if(self.x > 200 || self.x < 50)
        self.xspeed *= -1;
    self.x += self.xspeed;
    if(self.y > 400 || self.y < 100)
        self.yspeed *= -1;
    self.y += self.yspeed;
}

-(void)hitSurfaceAtAngle:(int)angle {
    
}

-(void)shake {
    if(self.x > 150)
        self.xspeed += 1;
}

@end
