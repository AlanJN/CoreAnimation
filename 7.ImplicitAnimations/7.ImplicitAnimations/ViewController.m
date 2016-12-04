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

@property (nonatomic, strong) UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self transactionsColor];
//    [self addLayerView];
//    [self checkViewAction];
//    [self pushAnimation];
    [self presentationVersusModel];
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
//    [button addTarget:self
//               action:@selector(changeLayerColor)
//     forControlEvents:UIControlEventTouchUpInside];
    
//    [button addTarget:self
//               action:@selector(changeLayerColorAgain)
//     forControlEvents:UIControlEventTouchUpInside];
    
    [button addTarget:self
               action:@selector(changeLayerColorWithCompletion)
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

- (void)changeLayerColorAgain {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0f];
    
    CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:redColor
                                                      green:greenColor
                                                       blue:blueColor
                                                      alpha:1.0f].CGColor;
    
    [CATransaction commit];
}

#pragma mark - Completion Blocks
- (void)changeLayerColorWithCompletion {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0f];
    
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        
        transform = CGAffineTransformRotate(transform, M_PI_4);
        
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:redColor
                                                      green:greenColor
                                                       blue:blueColor
                                                      alpha:1.0f].CGColor;
    
    [CATransaction commit];
}

#pragma mark - Layer Actions
- (void)addLayerView {
    
    self.layerView = [[UIView alloc] init];
    self.layerView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    self.layerView.bounds = CGRectMake(0, 0, 150, 150);
    self.layerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.layerView];
    
    UIButton *button = [[UIButton alloc] init];
    
    button.center = CGPointMake(self.view.frame.size.width / 2, 200);
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"改变颜色"
            forState:UIControlStateNormal];
    
    [button addTarget:self
               action:@selector(changeLayerViewColor)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)changeLayerViewColor {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0f];
    
    CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
    
    self.layerView.layer.backgroundColor = [UIColor colorWithRed:redColor
                                                           green:greenColor
                                                            blue:blueColor
                                                           alpha:1.0f].CGColor;
    
    [CATransaction commit];
}

- (void)checkViewAction {
    
    UIView *layerView = [[UIView alloc] init];
    
    layerView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    layerView.bounds = CGRectMake(0, 0, 150, 150);
    layerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:layerView];
    
    NSLog(@"Before: %@", [layerView actionForLayer:layerView.layer
                                            forKey:@"backgroundColor"]);
    
    [UIView beginAnimations:nil
                    context:nil];
    
    NSLog(@"After: %@", [layerView actionForLayer:layerView.layer
                                           forKey:@"backgroundColor"]);
    
    [UIView commitAnimations];
}

- (void)pushAnimation {
    
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
               action:@selector(pushChangeColor)
     forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    self.colorLayer  = [CALayer layer];
    self.colorLayer.position = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
    self.colorLayer.bounds = CGRectMake(0, 0, 150, 150);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    
    CATransition *transition = [CATransition animation];
    
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    self.colorLayer.actions = @{@"backgroundColor": transition};
    
    [view.layer addSublayer:self.colorLayer];
}

- (void)pushChangeColor {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0f];

    CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
    CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
    
    self.colorLayer.backgroundColor = [UIColor colorWithRed:redColor
                                                      green:greenColor
                                                       blue:blueColor
                                                      alpha:1.0f].CGColor;
    
    [CATransaction commit];
}

#pragma mark - Presentation Versus Model
- (void)presentationVersusModel {
    
    self.colorLayer  = [CALayer layer];
    self.colorLayer.position = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    self.colorLayer.bounds = CGRectMake(0, 0, 150, 150);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        
        CGFloat redColor = arc4random() / (CGFloat)INT_MAX;
        CGFloat greenColor = arc4random() / (CGFloat)INT_MAX;
        CGFloat blueColor = arc4random() / (CGFloat)INT_MAX;
        
        self.colorLayer.backgroundColor = [UIColor colorWithRed:redColor
                                                          green:greenColor
                                                           blue:blueColor
                                                          alpha:1.0f].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0f];
        
        self.colorLayer.position = point;
        
        [CATransaction commit];
    }
}

@end
