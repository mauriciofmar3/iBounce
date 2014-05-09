//
//  BouncingViewController.h
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"
#import "BouncingView.h"

@interface BouncingViewController : UIViewController<UIAccelerometerDelegate>

@property (nonatomic) Ball* ball;
@property (nonatomic) CADisplayLink* displayLink;
@property (nonatomic) BouncingView* view;

-(void)gameLoop;
@end
