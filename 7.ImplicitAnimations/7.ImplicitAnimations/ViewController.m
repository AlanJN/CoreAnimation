//
//  ViewController.m
//  7.ImplicitAnimations
//
//  Created by Cain on 2016/12/4.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self transactionsColor];
}

#pragma mark - Transactions
- (void)transactionsColor {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                            100,
                                                            self.view.frame.size.width,
                                                            self.view.frame.size.width)];
    
    view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:view];
    
    UIButton *button = [[UIButton alloc] init];
    
    button.center = CGPointMake(self.view.frame.size.width / 2, 50);
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"改变颜色"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(changeLayerColor)
     forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    self.colorLayer  = [CALayer layer];
    self.colorLayer.position = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
    self.colorLayer.bounds = CGRectMake(0, 0, 150, 150);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [view.layer addSublayer:self.colorLayer];
}

- (void)changeLayerColor {
    
    CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:redColor
                                                      green:greenColor
                                                       blue:blueColor
                                                      alpha:1.0f].CGColor;
}

@end
