//
//  MovingObjectDrawingVisitor.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface MovingObjectDrawingVisitor : NSObject

-(void)visitMovingObject:(Ball*) ball;
-(void)visitMovingObject:(MovingObject*) obj;

@end
