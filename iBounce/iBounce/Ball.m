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
        self.speed = 3;
    }
    return self;
}

-(void)update {
    if(self.x > 200 || self.x < 50)
        self.speed *= -1;
    self.x += self.speed;
}

@end
