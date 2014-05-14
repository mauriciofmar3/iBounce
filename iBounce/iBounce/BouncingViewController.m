//
//  BouncingViewController.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "BouncingViewController.h"
#import "Square.h"

@interface BouncingViewController ()

@end

@implementation BouncingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init {
    self = [super init];
    if(self) {
        
        CGRect viewRect = CGRectMake(0, 0, 200, 400);
        self.view = [[BouncingView alloc] initWithFrame:viewRect];
        self.view.backgroundColor = [UIColor whiteColor];

        MovingObjectContainer *container = [[MovingObjectContainer alloc] initWithBoundsX:200 andY:400];
        
        self.movingObjectContainer = container;
        self.view.movingObjectContainer = container;
//        container.movingObject = (MovingObject *)[[Ball alloc] initWithRadius:20 andX:100 andY:300];
        container.movingObject = (MovingObject *)[[Square alloc] initWithWidth:20 andX:150 andY:300];
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLoop)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
    }
    return self;
}

-(void)gameLoop
{
    [self.movingObjectContainer update];
    [self.view setNeedsDisplay];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        [self.movingObjectContainer shake];
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
