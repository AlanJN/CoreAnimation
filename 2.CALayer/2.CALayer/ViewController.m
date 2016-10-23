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
}

@end
