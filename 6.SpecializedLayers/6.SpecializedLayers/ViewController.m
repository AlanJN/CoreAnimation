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
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

@interface ViewController () <CALayerDelegate>

@property (nonatomic, strong) CAScrollLayer *scrollLayer;

@property (nonatomic, strong) EAGLContext *glContext;
@property (nonatomic, strong) CAEAGLLayer *glLayer;
@property (nonatomic, assign) GLuint framebuffer;
@property (nonatomic, assign) GLuint colorRenderbuffer;
@property (nonatomic, assign) GLuint framebufferWidth;
@property (nonatomic, assign) GLuint framebufferHeight;
@property (nonatomic, strong) GLKBaseEffect *effect;

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
//    [self gradientLayer];
//    [self replicatorLayer];
//    [self reflectionsLayer];
//    [self addScrollLayer];
//    [self addCATileLayer];
//    [self addCAEmitterLayer];
    [self addCAEAGLLayer];
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

#pragma mark - CAReplicatorLayer
- (void)replicatorLayer {
    
    UIView *view = [[UIView alloc] init];
    
    view.bounds = CGRectMake(0, 0, 100, 100);
    view.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 4.5);
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    replicatorLayer.frame = view.bounds;
    replicatorLayer.instanceCount = 10;  // 复制图层个数
    replicatorLayer.instanceBlueOffset = -1.0f; // 设置每一个图层的逐渐蓝色偏移
    replicatorLayer.instanceRedOffset = -1.0f;  // 设置每一个图层的逐渐红色偏移
    replicatorLayer.instanceAlphaOffset = -0.1f;
    replicatorLayer.instanceDelay = 0.33f;  // 设置每个图层延迟0.33f
    replicatorLayer.instanceTransform = transform;
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    [replicatorLayer addSublayer:layer];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [view.layer addSublayer:replicatorLayer];
    
    [self addLayerAnimation:layer];
    
    [self.view addSubview:view];
}

- (void)addLayerAnimation:(CALayer *)layer {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    animation.toValue =  @(layer.position.y - 25.0);
    animation.duration = 0.5;
    animation.autoreverses = true;
    animation.repeatCount = CGFLOAT_MAX;
    
    [layer addAnimation:animation forKey:nil];
}

- (void)reflectionsLayer {
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    replicatorLayer.instanceCount = 2;
    replicatorLayer.frame = CGRectMake(50, 100, 100, 100);

    CALayer *layer = [CALayer layer];
    
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"github"].CGImage);
    layer.frame = replicatorLayer.bounds;

    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DTranslate(transform, 0, layer.bounds.size.height, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceAlphaOffset = -0.6;
    
    [replicatorLayer addSublayer:layer];
    
    [self.view.layer addSublayer:replicatorLayer];
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark - CAScrollLayer
- (void)addScrollLayer {
    
    CALayer *layer = [CALayer layer];
    
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"github"].CGImage);
    layer.frame = CGRectMake(0, 0, 300, 300);
    
    self.scrollLayer = [CAScrollLayer layer];
    self.scrollLayer.frame = CGRectMake(50, 100, 150, 150);
    self.scrollLayer.scrollMode = kCAScrollBoth;
    self.scrollLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.scrollLayer addSublayer:layer];
    
    [self.view.layer addSublayer:self.scrollLayer];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)panGesture:(UIPanGestureRecognizer *)pan {
    
    CGPoint translocation = [pan translationInView:self.view];
    CGPoint origin = self.scrollLayer.bounds.origin;
    
    origin = CGPointMake(origin.x - translocation.x, origin.y - translocation.y);
    
    [self.scrollLayer scrollToPoint:origin];
    
    [pan setTranslation:CGPointZero inView:self.view];
}

#pragma mark - CATiledLayer
- (void)addCATileLayer {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    
    [self.view addSubview:scrollView];
    
    CATiledLayer *tiledLayer = [CATiledLayer layer];
    
    tiledLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tiledLayer.delegate = self;
    tiledLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [scrollView.layer addSublayer:tiledLayer];
    
    scrollView.contentSize = tiledLayer.frame.size;
    
    [tiledLayer setNeedsDisplay];
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    
    NSString *imageName = [NSString stringWithFormat:@"image%02zd_%02zd", x, y];
    
    UIImage *tileImage = [UIImage imageNamed:imageName];
    
    UIGraphicsPushContext(ctx);
    
    [tileImage drawInRect:bounds];
    
    UIGraphicsPopContext();
}

#pragma mark - CAEmitterLayer
- (void)addCAEmitterLayer {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.width)];
    
    [self.view addSubview:contentView];
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    
    emitterLayer.frame = contentView.bounds;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width / 2,
                                               emitterLayer.frame.size.height / 2);
    
    [contentView.layer addSublayer:emitterLayer];
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire"].CGImage);
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1.f
                                 green:0.5f
                                  blue:0.1f
                                 alpha:1.0f].CGColor;
    cell.alphaSpeed = -0.4f;
    cell.velocity = 50.f;
    cell.velocityRange = 50.f;
    cell.emissionRange = M_PI * 2.0f;
    
    emitterLayer.emitterCells = @[cell];
}

#pragma mark - CAEAGLLayer
- (void)addCAEAGLLayer {
    
    UIView *glView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    
    [self.view addSubview:glView];
    
    // 设置Context
    self.glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:self.glContext];
    
    // 设置显示的Layer
    self.glLayer = [CAEAGLLayer layer];
    self.glLayer.frame = glView.bounds;
    [glView.layer addSublayer:self.glLayer];
    self.glLayer.drawableProperties = @{kEAGLDrawablePropertyRetainedBacking : @NO,
                                        kEAGLDrawablePropertyColorFormat : kEAGLColorFormatRGBA8};
    
    self.effect = [[GLKBaseEffect alloc] init];
    
    [self setUpBuffers];
    [self drawFrame];
}

- (void)setUpBuffers {
    
    // 设置Frame
    glGenFramebuffers(1, &_framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
    
    // 设置颜色
    glGenRenderbuffers(1, &_colorRenderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderbuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
                              GL_RENDERBUFFER, _colorRenderbuffer);
    
    [self.glContext renderbufferStorage:GL_RENDERBUFFER
                           fromDrawable:self.glLayer];
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH,
                                 &_framebufferWidth);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT,
                                 &_framebufferHeight);
    
    // 检查是否成功
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        
        NSLog(@"%i", glCheckFramebufferStatus(GL_FRAMEBUFFER));
    }
}

- (void)tearDownBuffers {
    
    if (_framebuffer) {
        
        glDeleteFramebuffers(1, &_framebuffer);
        _framebuffer = 0;
    }
    
    if (_colorRenderbuffer) {
        
        glDeleteRenderbuffers(1, &_colorRenderbuffer);
        _colorRenderbuffer = 0;
    }
}

- (void)drawFrame {
    
    // 绑定缓冲区
    glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
    glViewport(0, 0, _framebufferWidth, _framebufferHeight);
    
    [self.effect prepareToDraw];
    
    // 清空屏幕
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0.0, 0.0, 0.0, 1.0);
    
    // 设置顶点
    GLfloat vertices[] = {
        -0.5f, -0.5f, -1.0f,
        0.0f, 0.5f, -1.0f,
        0.5f, -0.5f, -1.0f};
    
    // 设置颜色值
    GLfloat colors[] = {
        0.0f, 0.0f, 1.0f, 1.0f,
        0.0f, 1.0f, 0.0f, 1.0f,
        1.0f, 0.0f, 0.0f, 1.0f};
    
    // 开始画三角形
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribPosition,
                          3, GL_FLOAT, GL_FALSE, 0, vertices);
    glVertexAttribPointer(GLKVertexAttribColor,
                          4, GL_FLOAT, GL_FALSE, 0, colors);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    // 渲染
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderbuffer);
    [self.glContext presentRenderbuffer:GL_RENDERBUFFER];
}

- (void)dealloc {
    [self tearDownBuffers];
    
    [EAGLContext setCurrentContext:nil];
}

@end
