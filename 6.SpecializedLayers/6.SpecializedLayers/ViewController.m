//
//  ViewController.m
//  6.SpecializedLayers
//
//  Created by Cain Luo on 17/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createPath];
    [self viewRoundedCorners];
}

#pragma mark - CAShapeLayer
- (void)createPath {
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(175, 100)];
    [path addQuadCurveToPoint:CGPointMake(100, 500)
                 controlPoint:CGPointMake(250, 600)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 10;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void)viewRoundedCorners {
    
    CGRect rect = CGRectMake(130, 130, 100, 100);
    CGSize radii = CGSizeMake(10, 10);
    
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft | UIRectCornerTopLeft;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:corners
                                                     cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

@end
