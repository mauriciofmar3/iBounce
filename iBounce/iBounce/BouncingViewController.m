//
//  BouncingViewController.m
//  iBounce
//
//  Created by Mauricio Bell'Albero on 5/9/14.
//  Copyright (c) 2014 com.maumau. All rights reserved.
//

#import "BouncingViewController.h"

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
        // Do any additional setup after loading the view.
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLoop)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLoop)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gameLoop
{
    //Updates the balls position
    
    [self.ball update];
    [self.view setNeedsDisplay];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
