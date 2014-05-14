//
//  BouncingView.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/7/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "BouncingView.h"
#import "Ball.h"
#import "Square.h"

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
    
    CGRect bounds = [self bounds];
    [[UIColor whiteColor]set];
    UIRectFill(bounds);
    if ([self.movingObjectContainer.movingObject class] == [Ball class])
        [self drawBall];
    if ([self.movingObjectContainer.movingObject class] == [Square class])
        [self drawSquare];
}

- (void)drawBall
{
    Ball *ball = (Ball *) self.movingObjectContainer.movingObject;
    CGPoint point = CGPointMake(ball.x, ball.y);
    int radius = ball.radius;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGRect circle = CGRectMake(point.x - radius, point.y + radius, radius*2, radius*2);
    CGContextFillEllipseInRect(context, circle);
    CGContextStrokePath(context);
}

- (void)drawSquare
{
    Square *ball = (Square *) self.movingObjectContainer.movingObject;
    CGPoint points[4];
    [ball points:points];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for(int i = 0; i < 4; i++)
        if(i == 0)
            CGContextMoveToPoint(context, points[i].x, points[i].y);
        else
            CGContextAddLineToPoint(context, points[i].x, points[i].y);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
}

@end
