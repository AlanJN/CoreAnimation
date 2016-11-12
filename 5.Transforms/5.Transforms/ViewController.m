//
//  ViewController.m
//  5.Transforms
//
//  Created by Cain Luo on 2/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h> 
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

//    [self viewTransform];
//    [self viewCombiningTransforms];
//    [self viewTransforms3D];
//    [self viewPerspectiveProjection];
//    [self viewSublayerTransform];
//    [self viewBackfaces];
//    [self viewLayerFlattening];
    [self viewSolidObjects];
}

#pragma mark - Affine Transforms
- (void)viewTransform {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [self.view addSubview:imageView];
    
    // 旋转
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    imageView.layer.affineTransform = transform;
    
    // 缩放
//    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.5, 0.5);
//    imageView.layer.affineTransform = scaleTransform;
    
    // 平移
//    CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(50, 50);
//    imageView.layer.affineTransform = translationTransform;
}

- (void)viewCombiningTransforms {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [self.view addSubview:imageView];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    // 旋转
    transform = CGAffineTransformRotate(transform, M_PI_4);
    // 缩放
    transform = CGAffineTransformScale(transform, 0.5f, 0.5f);
    // 平移
    transform = CGAffineTransformTranslate(transform, 200, 0);
    
    imageView.layer.affineTransform = transform;
}

#pragma mark - 3D Transforms
- (void)viewTransforms3D {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [self.view addSubview:imageView];

    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    imageView.layer.transform = transform;
}

- (void)viewPerspectiveProjection {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [self.view addSubview:imageView];
    
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    imageView.layer.transform = transform;
    
    CATransform3D transform3DIdentity = CATransform3DIdentity;
    transform3DIdentity.m34 = - 1.0 / 500.0;
    transform3DIdentity = CATransform3DRotate(transform3DIdentity, M_PI_4, 0, 1, 0);
    imageView.layer.transform = transform3DIdentity;
}

- (void)viewSublayerTransform {
    
    UIImageView *imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 100, 100)];
    
    imageViewOne.image = [UIImage imageNamed:@"expression"];
    
    UIImageView *imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(250, 100, 100, 100)];
    
    imageViewTwo.image = [UIImage imageNamed:@"expression"];

    [self.view addSubview:imageViewOne];
    [self.view addSubview:imageViewTwo];
    
    CATransform3D perspective = CATransform3DIdentity; perspective.m34 = - 1.0 / 500.0;
    
    self.view.layer.sublayerTransform = perspective;
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
    imageViewOne.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    
    imageViewTwo.layer.transform = transform2;
}

- (void)viewBackfaces {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [self.view addSubview:imageView];
        
    CATransform3D transform3DIdentity = CATransform3DIdentity;
    transform3DIdentity.m34 = - 1.0 / 500.0;
    transform3DIdentity = CATransform3DRotate(transform3DIdentity, M_PI, 0, 1, 0);
    imageView.layer.transform = transform3DIdentity;
}

- (void)viewLayerFlattening {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    imageView.image = [UIImage imageNamed:@"expression"];
    
    [view addSubview:imageView];
    
//    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    view.layer.transform = outer;
//    
//    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
//    imageView.layer.transform = inner;
    
    // 3D Trans
    CATransform3D outer = CATransform3DIdentity; outer.m34 = -1.0 / 500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0); view.layer.transform = outer;
    
    CATransform3D inner = CATransform3DIdentity; inner.m34 = -1.0 / 500.0;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0); imageView.layer.transform = inner;
}

#pragma mark - Solid Objects
- (void)viewSolidObjects {
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;

    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);

    self.view.layer.sublayerTransform = perspective;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);

    for (NSInteger i = 0; i < 6; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor redColor];
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.layer.borderWidth = 0.5;
        label.tag = i;
        label.text = [NSString stringWithFormat:@"%ld", i + 1];
        label.font = [UIFont systemFontOfSize:30];
        label.textAlignment = NSTextAlignmentCenter;
        
        switch (label.tag) {
            case 0: {
                
                [self addLabel:label withTransform:transform];
            }
                break;
            case 1: {
                transform = CATransform3DMakeTranslation(100, 0, 0);
                transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
                
                [self addLabel:label withTransform:transform];
            }
                break;
            case 2: {
                transform = CATransform3DMakeTranslation(0, -100, 0);
                transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
                
                [self addLabel:label withTransform:transform];
            }
                break;
            case 3: {
                transform = CATransform3DMakeTranslation(0, 100, 0);
                transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
                
                [self addLabel:label withTransform:transform];
            }
                break;
            case 4: {
                transform = CATransform3DMakeTranslation(-100, 0, 0);
                transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
                
                [self addLabel:label withTransform:transform];
            }
                break;
            case 5: {
                transform = CATransform3DMakeTranslation(0, 0, -100);
                transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
                
                [self addLabel:label withTransform:transform];
            }
                break;
            default:
                break;
        }
    }
}

- (void)addLabel:(UILabel *)label withTransform:(CATransform3D)transform {
    
    [self.view addSubview:label];
    
    CGSize containerSize = self.view.bounds.size;
    
    label.center = CGPointMake(containerSize.width / 2.0,
                               containerSize.height / 2.0);
    
    label.layer.transform = transform;
    
    [self addLightingToLabel:label.layer];
}

- (void)addLightingToLabel:(CALayer *)labelLayer {
    
    CALayer *layer = [CALayer layer];
    layer.frame = labelLayer.bounds;
    
    [labelLayer addSublayer:layer];
    
    CATransform3D transform = labelLayer.transform;
    
    GLKMatrix4 matrix4 = [self matrixFrom3DTransformation:transform];
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    CGFloat dotProduct = GLKVector3DotProduct(normal, light);
    
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    
    layer.backgroundColor = color.CGColor;
}

- (GLKMatrix4)matrixFrom3DTransformation:(CATransform3D)transform {
    GLKMatrix4 matrix = GLKMatrix4Make(transform.m11, transform.m12, transform.m13, transform.m14,
                                       transform.m21, transform.m22, transform.m23, transform.m24,
                                       transform.m31, transform.m32, transform.m33, transform.m34,
                                       transform.m41, transform.m42, transform.m43, transform.m44);
    
    return matrix;
}

@end
