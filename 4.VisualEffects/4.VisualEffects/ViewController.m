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
//    [self layerShadowClipping];
//    [self layerShadowPath];
//    [self layerMasking];
    [self layerScalingFilters];
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

- (void)layerShadowPath {
    
    UIView *shadowViewOne = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    UIView *shadowViewTwo = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 100, 100)];

    shadowViewOne.layer.shadowOpacity = 0.5f;
    shadowViewTwo.layer.shadowOpacity = 0.5f;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, shadowViewOne.bounds);
    shadowViewOne.layer.shadowPath = squarePath;
    
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, shadowViewTwo.bounds);
    shadowViewTwo.layer.shadowPath = circlePath;
    
    CGPathRelease(circlePath);

    [self.view addSubview:shadowViewOne];
    [self.view addSubview:shadowViewTwo];
}

/**
 *  Layer Masking
 */
- (void)layerMasking {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"arrow"];
    
    CALayer *maskLayer = [CALayer layer];
    UIImage *maskImage = [UIImage imageNamed:@"star"];
    
    maskLayer.frame = imageView.bounds;
    maskLayer.contents = (__bridge id _Nullable)(maskImage.CGImage);
    
    imageView.layer.mask = maskLayer;
    
    [self.view addSubview:imageView];
}

/**
 *  Scaling Filters
 */
- (void)layerScalingFilters {
    
    UIImageView *imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width / 2, 200)];
    UIImageView *imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 100, self.view.bounds.size.width / 2, 200)];
    UIImageView *imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width / 2, 200)];
    
    imageViewOne.image = [UIImage imageNamed:@"expression"];
    imageViewTwo.image = [UIImage imageNamed:@"expression"];
    imageViewThree.image = [UIImage imageNamed:@"expression"];

    imageViewOne.layer.magnificationFilter = kCAFilterNearest;
    imageViewTwo.layer.magnificationFilter = kCAFilterLinear;
    imageViewThree.layer.magnificationFilter = kCAFilterTrilinear;

    imageViewOne.layer.minificationFilter = kCAFilterNearest;
    imageViewTwo.layer.minificationFilter = kCAFilterLinear;
    imageViewThree.layer.minificationFilter = kCAFilterTrilinear;
    
    [self.view addSubview:imageViewOne];
    [self.view addSubview:imageViewTwo];
    [self.view addSubview:imageViewThree];
}

@end
