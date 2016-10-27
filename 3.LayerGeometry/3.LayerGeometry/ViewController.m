//
//  ViewController.m
//  3.LayerGeometry
//
//  Created by Cain Luo on 25/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self logViewAndLayer];
//    [self layerTransform];
//    [self viewAnchorPoint];
//    [self layerGeometryFlipped];
//    [self viewsZPosition];
    [self hitTestingLayer];
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

/**
 *  GeometryFlipped
 */
- (void)layerGeometryFlipped {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor blueColor];
    view.layer.geometryFlipped = YES;
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(0, 0, 25, 25);
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [view.layer addSublayer:layer];
    
    [self.view addSubview:view];
}

/**
 *  The Z Axis
 */
- (void)viewsZPosition {
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    greenView.backgroundColor = [UIColor greenColor];
    greenView.layer.zPosition = 1.0f;
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:greenView];
    [self.view addSubview:redView];
}

/**
 *  Hit Testing
 */
- (void)hitTestingLayer {
    
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    _backgroundView.backgroundColor = [UIColor grayColor];
    
    _blueLayer = [CALayer layer];
    
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    _blueLayer.frame = CGRectMake(25, 25, 50, 50);
    
    [_backgroundView.layer addSublayer:_blueLayer];
    
    [self.view addSubview:_backgroundView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CALayer *layer = [self.backgroundView.layer hitTest:point];
    
    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"你点击了屏幕"
                                                       message:@""
                                                      delegate:nil
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];

    if (layer == self.blueLayer) {
        
        alerView.message = @"你点中了蓝色的Layer";
        
    } else if (layer == self.backgroundView.layer){
        
        alerView.message = @"你点中了灰色的Layer";
        
    } else {
        alerView.message = @"你点中了其他的Layer";
    }
    
    [alerView show];
}

@end
