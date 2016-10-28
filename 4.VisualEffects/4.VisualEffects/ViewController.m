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
    
//    [self layerRoundedCorners];
//    [self layerBorders];
//    [self layerDropShadows];
    [self layerShadowClipping];
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
    
    NSLog(@"%@", view.layer.borderColor);
    NSLog(@"%f", view.layer.borderWidth);
}

/**
 *  Layer Borders
 */
- (void)layerBorders {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor blueColor];
    view.layer.borderWidth = 5.f;
    view.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addSubview:view];
}

/**
 *  Drop Shadows
 */
- (void)layerDropShadows {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor redColor];
    view.layer.shadowOpacity = 1.0f;
    view.layer.shadowOffset = CGSizeMake(0, 3);
    view.layer.shadowRadius = 10.f;
    view.layer.shadowColor = [UIColor blueColor].CGColor;
    
    [self.view addSubview:view];
}

- (void)layerShadowClipping {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    contentView.backgroundColor = [UIColor grayColor];
    blueView.backgroundColor = [UIColor blueColor];
    
    contentView.layer.masksToBounds = YES;
    
    shadowView.layer.shadowOpacity = 1.0f;
    shadowView.layer.shadowOffset = CGSizeMake(0, 0.5f);
    shadowView.layer.shadowColor = [UIColor redColor].CGColor;

    [contentView addSubview:blueView];
    [shadowView addSubview:contentView];
    
    [self.view addSubview:shadowView];
}

@end
