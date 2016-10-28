//
//  ViewController.m
//  4.VisualEffects
//
//  Created by Cain Luo on 28/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layerRoundedCorners];
}

/**
 *  Rounded Corners
 */
- (void)layerRoundedCorners {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = 50.f;
    view.layer.masksToBounds = YES;
    
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.frame = CGRectMake(50, 50, 50, 50);
    
    [view.layer addSublayer:layer];
    [self.view addSubview:view];
}


@end
