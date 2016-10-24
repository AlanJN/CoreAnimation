//
//  ViewController.m
//  3.Layer Geometry
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
    
    [self logViewAndLayer];
}

/**
 *  Layout
 */
- (void)logViewAndLayer {

    NSLog(@"View X: %f", self.view.frame.origin.x);
    NSLog(@"View Y: %f", self.view.frame.origin.y);
    NSLog(@"View Width: %f", self.view.frame.size.width);
    NSLog(@"View Height: %f", self.view.frame.size.height);
    NSLog(@"\n");
    NSLog(@"Layer X: %f", self.view.layer.frame.origin.x);
    NSLog(@"Layer Y: %f", self.view.layer.frame.origin.y);
    NSLog(@"Layer Width: %f", self.view.layer.frame.size.width);
    NSLog(@"Layer Height: %f", self.view.layer.frame.size.height);
}

@end
