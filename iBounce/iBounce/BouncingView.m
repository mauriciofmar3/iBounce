//
//  BouncingView.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/7/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "BouncingView.h"
#import "Ball.h"

@implementation BouncingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    Ball *ball = (Ball *) self.movingObjectContainer.movingObject;
    
    CGRect bounds = [self bounds];
    [[UIColor whiteColor]set];
    UIRectFill(bounds);
    
    CGPoint point = CGPointMake(ball.x, ball.y);
    int radius = ball.radius;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGRect circle = CGRectMake(point.x - radius, point.y + radius, radius*2, radius*2);
    CGContextFillEllipseInRect(context, circle);
    CGContextStrokePath(context);
}

@end
