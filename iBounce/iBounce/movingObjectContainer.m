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

int shakeEdgeThreshold = 50;

- (id)initWithBoundsX:(int)x andY:(int)y {
    self = [super init];
    if(self) {
        self.movingObject = [[Ball alloc] initWithRadius:20
                        andX:self.bounds.size.width/2 andY:self.bounds.size.width/2];
        self.bounds = CGRectMake(0, 0, x, y);
        
        self.shakeForceRatio = 2.0;
    }
    return self;
}

-(void)update {
    CGRect objectBounds = [self.movingObject bounds];
    if (objectBounds.origin.x <= self.bounds.origin.x)
        [self.movingObject hitLeftWithForce:1];
    
    if (objectBounds.origin.y <= self.bounds.origin.y)
        [self.movingObject hitTopWithForce:1];
    
    if ((objectBounds.origin.x + objectBounds.size.width) >=
       (self.bounds.origin.x + self.bounds.size.width))
        [self.movingObject hitRightWithForce:1];
    
    if ((objectBounds.origin.y + objectBounds.size.height) >=
       (self.bounds.origin.y + self.bounds.size.height))
        [self.movingObject hitBottomWithForce:1];
    
    [self.movingObject update];
}

-(void)shake {
        
    CGRect objectBounds = [self.movingObject bounds];
    if (objectBounds.origin.x <= self.bounds.origin.x + self.shakeForceRatio)
        [self.movingObject hitLeftWithForce:self.shakeForceRatio];
    
    if (objectBounds.origin.y <= self.bounds.origin.y + self.shakeForceRatio)
        [self.movingObject hitTopWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.x + objectBounds.size.width) >=
        (self.bounds.origin.x + self.bounds.size.width - self.shakeForceRatio))
        [self.movingObject hitRightWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.y + objectBounds.size.height) >=
        (self.bounds.origin.y + self.bounds.size.height - self.shakeForceRatio))
        [self.movingObject hitBottomWithForce:self.shakeForceRatio];
}

@end
