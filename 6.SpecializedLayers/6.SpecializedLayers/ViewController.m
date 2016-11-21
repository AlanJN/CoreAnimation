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
    [self createCLLabel];
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

@end
