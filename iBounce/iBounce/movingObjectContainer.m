//
//  MovingObjectContainer.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "MovingObjectContainer.h"
#import "Ball.h"

@implementation MovingObjectContainer

float shakeForceRatio = 2.0;

- (id)initWithBoundsX:(int)x andY:(int)y {
    self = [super init];
    if(self) {
        self.movingObject = [[Ball alloc] initWithRadius:20
                        andX:self.bounds.size.width/2 andY:self.bounds.size.width/2];
        self.bounds = CGRectMake(0, 0, x, y);
    }
    return self;
}

-(void)update {
    CGRect objectBounds = [self.movingObject bounds];
    if (objectBounds.origin.x <= self.bounds.origin.x)
        [self.movingObject hitLeftWithForce:self.forceRatio];
    
    if (objectBounds.origin.y <= self.bounds.origin.y)
        [self.movingObject hitTopWithForce:self.forceRatio];
    
    if ((objectBounds.origin.x + objectBounds.size.width) >=
       (self.bounds.origin.x + self.bounds.size.width))
        [self.movingObject hitRightWithForce:self.forceRatio];
    
    if ((objectBounds.origin.y + objectBounds.size.height) >=
       (self.bounds.origin.y + self.bounds.size.height))
        [self.movingObject hitBottomWithForce:self.forceRatio];
    
    [self.movingObject update];
}

-(void)shake {
    int threshold = 50;
        
    CGRect objectBounds = [self.movingObject bounds];
    if (objectBounds.origin.x <= self.bounds.origin.x + threshold)
        [self.movingObject hitLeftWithForce:self.shakeForceRatio];
    
    if (objectBounds.origin.y <= self.bounds.origin.y + threshold)
        [self.movingObject hitTopWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.x + objectBounds.size.width) >=
        (self.bounds.origin.x + self.bounds.size.width - threshold))
        [self.movingObject hitRightWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.y + objectBounds.size.height) >=
        (self.bounds.origin.y + self.bounds.size.height - threshold))
        [self.movingObject hitBottomWithForce:self.shakeForceRatio];
}

@end
