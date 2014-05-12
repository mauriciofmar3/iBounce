//
//  MovingObjectContainer.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovingObject.h"

@interface MovingObjectContainer : NSObject

@property (nonatomic) MovingObject* movingObject;
@property (nonatomic) CGRect bounds;
@property (nonatomic) int forceRatio;

-(void)shake;
-(void)update;

-(id)initWithBoundsX:(int)x andY:(int)y;

@end
