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
    [self layerDropShadows];
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

@end
