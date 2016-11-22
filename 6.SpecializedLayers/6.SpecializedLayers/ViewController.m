//
//  ViewController.m
//  6.SpecializedLayers
//
//  Created by Cain Luo on 17/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "CLLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createPath];
//    [self viewRoundedCorners];
//    [self catextLayer];
//    [self attributedString];
//    [self createCLLabel];
//    [self transformLayer];
    [self gradientLayer];
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

#pragma mark - CATextLayer
- (void)catextLayer {
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 300, 300)];
    
    labelView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:labelView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    
    [labelView.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
    
    NSString *text = @"这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字";
    
    textLayer.string = text;
}

- (void)attributedString {
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 400)];
    
    [self.view addSubview:labelView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    
    textLayer.frame = labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [labelView.layer addSublayer:textLayer];
    
    textLayer.alignmentMode = kCAAlignmentJustified; textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];

    NSString *text = @"这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字, 这是一段测试的文字";
    
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName; CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    NSDictionary *attribs = @{(__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef};
    
    [string setAttributes:attribs range:NSMakeRange(0, [text length])];
    
    attribs = @{(__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef};
    
    [string setAttributes:attribs range:NSMakeRange(6, 20)];
    
    CFRelease(fontRef);
    
    textLayer.string = string;
}

- (void)createCLLabel {
    
    CLLabel *label = [[CLLabel alloc] initWithFrame:CGRectMake(20, 50, 200, 200)];
    
    label.text = @"这是一段很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试文字";
    label.textColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}

#pragma mark - CATransformLayer
- (void)transformLayer {
    
    self.view.backgroundColor = [UIColor grayColor];
    
    CATransform3D transform3DOne = CATransform3DIdentity;
    
    transform3DOne.m34 = -1.0 / 500.0;
    
    self.view.layer.sublayerTransform = transform3DOne;
    
    CATransform3D transform3DTwo = CATransform3DIdentity;
    
    transform3DTwo = CATransform3DTranslate(transform3DTwo, -100, 0, 0);
    
    CALayer *cubeOne = [self cubeWithTransform:transform3DTwo];
    
    [self.view.layer addSublayer:cubeOne];
    
    CATransform3D transform3DThree = CATransform3DIdentity;
    
    transform3DThree = CATransform3DTranslate(transform3DThree, 100, 0, 0);
    transform3DThree = CATransform3DRotate(transform3DThree, -M_PI_4, 1, 0, 0);
    transform3DThree = CATransform3DRotate(transform3DThree, -M_PI_4, 0, 1, 0);
    
    CALayer *cubeTwo = [self cubeWithTransform:transform3DThree];
    
    [self.view.layer addSublayer:cubeTwo];
}

- (CALayer *)layerWithTransform:(CATransform3D)transform {
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(-50, -50, 100, 100);
    
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (100000 / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    
    layer.backgroundColor = [UIColor colorWithRed:red
                                            green:green
                                             blue:blue
                                            alpha:1.0f].CGColor;
    layer.transform = transform;
    
    return layer;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform {
    
    // cube
    CATransformLayer *cube = [CATransformLayer layer];
    
    // layer one
    CATransform3D transform3D = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self layerWithTransform:transform3D]];
    
    // layer two
    transform3D = CATransform3DMakeTranslation(50, 0, 0);
    transform3D = CATransform3DRotate(transform3D, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self layerWithTransform:transform3D]];
    
    // layer three
    transform3D = CATransform3DMakeTranslation(0, -50, 0);
    transform3D = CATransform3DRotate(transform3D, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self layerWithTransform:transform3D]];

    // layer five
    transform3D = CATransform3DMakeTranslation(-50, 0, 0);
    transform3D = CATransform3DRotate(transform3D, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self layerWithTransform:transform3D]];

    // layer six
    transform3D = CATransform3DMakeTranslation(0, 0, -50);
    transform3D = CATransform3DRotate(transform3D, M_PI, 0, 1, 0);
    [cube addSublayer:[self layerWithTransform:transform3D]];

    CGSize containerSize = self.view.bounds.size;
    
    cube.position = CGPointMake(containerSize.width / 2.0,
                                containerSize.height / 2.0);
    
    cube.transform = transform;
    
    return cube;
}

#pragma mark - CAGradientLayer
- (void)gradientLayer {
    
    UIView *view = [[UIView alloc] init];
    
    view.bounds = CGRectMake(0, 0, 200, 200);
    view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    // 设置渐变的颜色, 理论上来讲是无限添加的
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0, 0); // 开始渐变的点
    gradientLayer.endPoint = CGPointMake(1, 1); // 结束渐变的点
    
    gradientLayer.locations = @[@0.0, @0.2]; // 设置渐变的区域
    
    [view.layer addSublayer:gradientLayer];
    
    [self.view addSubview:view];
}

@end
