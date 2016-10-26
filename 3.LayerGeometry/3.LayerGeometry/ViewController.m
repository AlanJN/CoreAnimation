//
//  ViewController.m
//  3.LayerGeometry
//
//  Created by Cain Luo on 25/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self logViewAndLayer];
//    [self layerTransform];
    [self viewAnchorPoint];
}

/**
 *  Layout
 */
- (void)logViewAndLayer {
    
    NSLog(@"View X: %f", self.view.center.x);
    NSLog(@"View Y: %f", self.view.center.y);
    NSLog(@"View Frame Width: %f", self.view.frame.size.width);
    NSLog(@"View Frame Height: %f", self.view.frame.size.height);
    NSLog(@"View Bounds Width: %f", self.view.bounds.size.width);
    NSLog(@"View Bounds Height: %f", self.view.bounds.size.height);
    NSLog(@"\n");
    NSLog(@"Layer X: %f", self.view.layer.position.x);
    NSLog(@"Layer Y: %f", self.view.layer.position.y);
    NSLog(@"Layer Frame Width: %f", self.view.layer.frame.size.width);
    NSLog(@"Layer Frame Height: %f", self.view.layer.frame.size.height);
    NSLog(@"Layer Bounds Width: %f", self.view.layer.bounds.size.width);
    NSLog(@"Layer Bounds Height: %f", self.view.layer.bounds.size.height);

}

- (void)layerTransform {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    view.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    
    NSLog(@"View X: %f", view.center.x);
    NSLog(@"View Y: %f", view.center.y);
    NSLog(@"View Frame Width: %f", view.frame.size.width);
    NSLog(@"View Frame Height: %f", view.frame.size.height);
    NSLog(@"View Bounds Width: %f", view.bounds.size.width);
    NSLog(@"View Bounds Height: %f", view.bounds.size.height);
    NSLog(@"\n");
    NSLog(@"Layer X: %f", view.layer.position.x);
    NSLog(@"Layer Y: %f", view.layer.position.y);
    NSLog(@"Layer Frame Width: %f", view.layer.frame.size.width);
    NSLog(@"Layer Frame Height: %f", view.layer.frame.size.height);
    NSLog(@"Layer Bounds Width: %f", view.layer.bounds.size.width);
    NSLog(@"Layer Bounds Height: %f", view.layer.bounds.size.height);
}

/**
 *  AnchorPoint
 */
- (void)viewAnchorPoint {
    
    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];

    viewOne.backgroundColor = [UIColor grayColor];

    NSLog(@"before X: %f", viewOne.layer.frame.origin.x);
    NSLog(@"before Y: %f", viewOne.layer.frame.origin.y);
    
    // change anchorPoint
    viewOne.layer.anchorPoint = CGPointMake(0.1f, 0.1f);

    NSLog(@"After X: %f", viewOne.layer.frame.origin.x);
    NSLog(@"After Y:%f", viewOne.layer.frame.origin.y);
    
    UIView *viewTwo = [[UIView alloc] init];
    
    viewTwo.backgroundColor = [UIColor redColor];
    viewTwo.bounds = CGRectMake(0, 0, 100, 100);
    viewTwo.center = viewOne.center;

    [self.view addSubview:viewOne];
    [self.view addSubview:viewTwo];
}

@end
