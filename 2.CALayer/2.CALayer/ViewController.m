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

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *layerView = [[UIView alloc] init];
    layerView.backgroundColor = [UIColor whiteColor];
    layerView.center = self.view.center;
    layerView.bounds = CGRectMake(0, 0, 200, 200);
    
    [self.view addSubview:layerView];
    
    
    UIImage *image = [UIImage imageNamed:@"bear"];
    
    layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear"]];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    
    [self.view addSubview:imageView];
}

@end
