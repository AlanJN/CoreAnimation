//
//  ViewController.m
//  8.ExplicitAnimations
//
//  Created by Cain on 2016/12/9.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBasicAnimation];
}

#pragma mark - CABasicAnimation
- (void)createBasicAnimation {
    
    UIButton *button = [[UIButton alloc] init];
    
    button.center = CGPointMake(self.view.frame.size.width / 2,
                                self.view.frame.size.height / 2 - 200);
    button.bounds = CGRectMake(0, 0, 200, 50);
    button.backgroundColor = [UIColor redColor];
    
    [button setTitle:@"改变颜色"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(changeLayerColor)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    UIView *layerView = [[UIView alloc] init];
    
    layerView.center = CGPointMake(self.view.frame.size.width / 2,
                                   self.view.frame.size.height / 2);
    layerView.bounds = CGRectMake(0, 0, 200, 200);
    layerView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:layerView];
    
    self.colorLayer = [CALayer layer];
    
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [layerView.layer addSublayer:self.colorLayer];
}

- (void)changeLayerColor {
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    UIColor *color = [UIColor colorWithRed:red
                                     green:green
                                      blue:blue
                                     alpha:1.0];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    
    [self.colorLayer addAnimation:animation forKey:nil];
}

@end
