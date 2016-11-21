//
//  CLLabel.m
//  6.SpecializedLayers
//
//  Created by Cain Luo on 22/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation CLLabel

+ (Class)layerClass {
    
    return [CATextLayer class];
}

- (CATextLayer *)textLayer {
    
    return (CATextLayer *)self.layer;
}

- (void)setUp {
    
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    [self textLayer].wrapped = YES;
    [self.layer display];
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
    }
    
    return self;
}

- (void)awakeFromNib {
    
    [self setUp];
}

- (void)setText:(NSString *)text {
    super.text = text;
    
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor {
    super.textColor = textColor;
    
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    super.font = font;
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}

@end
