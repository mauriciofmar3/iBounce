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

- (id)initWithBoundsX:(int)x andY:(int)y {
    self = [super init];
    if(self) {
        self.bounds = CGRectMake(0, 45, x+120, y+26);
        
        self.shakeForceRatio = 2.0;
        self.shakeEdgeThreshold = 50;
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
    if (objectBounds.origin.x <= self.bounds.origin.x + self.shakeEdgeThreshold)
        [self.movingObject hitLeftWithForce:self.shakeForceRatio];
    
    if (objectBounds.origin.y <= self.bounds.origin.y + self.shakeEdgeThreshold)
        [self.movingObject hitTopWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.x + objectBounds.size.width) >=
        (self.bounds.origin.x + self.bounds.size.width - self.shakeEdgeThreshold))
        [self.movingObject hitRightWithForce:self.shakeForceRatio];
    
    if ((objectBounds.origin.y + objectBounds.size.height) >=
        (self.bounds.origin.y + self.bounds.size.height - self.shakeEdgeThreshold))
        [self.movingObject hitBottomWithForce:self.shakeForceRatio];
}

@end
