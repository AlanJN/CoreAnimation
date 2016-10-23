//
//  ViewController.m
//  2.CALayer
//
//  Created by Cain Luo on 22/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear"]];
//    imageView.frame = CGRectMake(0, 0, 200, 200);
//
//    [self.view addSubview:imageView];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *layerView = [[UIView alloc] init];
    layerView.backgroundColor = [UIColor whiteColor];
    layerView.center = self.view.center;
    layerView.bounds = CGRectMake(0, 0, 200, 200);
    
    [self.view addSubview:layerView];
    
    
    UIImage *image = [UIImage imageNamed:@"bear"];
    
    /**
     *  Contents
     */
    layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    /**
     *  ContentsGravity
     */
    layerView.layer.contentsGravity = kCAGravityCenter;
    
    /**
     *  ContentsScale
     */
    layerView.layer.contentsScale = image.scale;
    
    /**
     *  MasksToBounds
     */
    layerView.layer.masksToBounds = YES;
    
    /**
     *  contentsRect
     */
    layerView.layer.contentsRect = CGRectMake(0, 0, 1.1, 1.1);
    
    /**
     *  contentsCenter
     */
    [self addImage:[UIImage imageNamed:@"bear"] withContensRect:CGRectMake(0.25, 0.25, 0.5, 0.5)];
    
    /**
     *  DrawLayer
     */
    [self createNewLayerWithSuperView];
}

// CALayer Contents Center
- (void)addImage:(UIImage *)image withContensRect:(CGRect)rect {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    view.layer.contents = (__bridge id _Nullable)(image.CGImage);
    view.layer.contentsCenter = rect;
    
    [self.view addSubview:view];
}

// CALayer Draw Layer
- (void)createNewLayerWithSuperView {
    
    // Background View
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(220, 0, 100, 100)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:backgroundView];
    
    // Blue Layer
    CALayer *blueLayer = [CALayer layer];
    
    blueLayer.frame = CGRectMake(25, 25, 50, 50);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    // Set Layer Delegate
    blueLayer.delegate = self;
    
    // Set Layer contentsScale
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [backgroundView.layer addSublayer:blueLayer];
    
    [blueLayer display];
}

/**
 *  CALayerDelegate
 *
 *  @param layer layer
 *  @param ctx   ctx
 */
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
