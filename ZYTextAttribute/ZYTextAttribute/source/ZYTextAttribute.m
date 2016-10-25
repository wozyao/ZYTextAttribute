//
//  ZYTextAttribute.m
//  PKA
//
//  Created by 郑遥 on 15/6/16.
//  Copyright (c) 2015年 JPY. All rights reserved.
//

#import "ZYTextAttribute.h"

NSString * const RANGEKEY = @"range";
NSString * const COLORKEY = @"color";
NSString * const FONTKEY = @"font";
NSString * const UNDERLINESTYLEKEY = @"underlineStyle";

@implementation ZYTextAttribute

+ (void)properFont:(CGFloat)fontSize color:(UIColor *)color underlineStyle:(NSUnderlineStyle)underlineStyle withView:(UIView *)view range:(NSRange)range
{
    NSMutableAttributedString *attributedString = nil;
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)view;
        if (!label.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    } else if ([view isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)view;
        if (!button.titleLabel.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    }
    
    // 设置颜色
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    // 设置尺寸
    if (fontSize) {
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    }
    
    // 设置下划线
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:underlineStyle] range:range];
    
    if ([view isKindOfClass:[UILabel class]]) {   // 设置label文字属性
        ((UILabel *)view).attributedText = attributedString;
    } else {                                      // 设置按钮文字属性
        [(UIButton *)view setAttributedTitle:attributedString forState:UIControlStateNormal];
    }
}

+ (void)properFont:(CGFloat)fontSize withView:(UIView *)view range:(NSRange)range
{
    [self properFont:fontSize color:nil underlineStyle:NSUnderlineStyleNone withView:view range:range];
}

+ (void)properColor:(UIColor *)color withView:(UIView *)view range:(NSRange)range
{
    [self properFont:0.0 color:color underlineStyle:NSUnderlineStyleNone withView:view range:range];
}

+ (void)properUnderlineStyleSingleWithView:(UIView *)view range:(NSRange)range
{
    [self properFont:0.0 color:nil underlineStyle:NSUnderlineStyleSingle withView:view range:range];
}

#pragma mark - 增加多个范围文字设置  add by zhengyao
/**
 *  设置label或button的若干个范围内的文字属性
 */
+ (void)properFont:(CGFloat)fontSize color:(UIColor *)color underlineStyle:(NSUnderlineStyle)underlineStyle withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray {
    NSMutableAttributedString *attributedString = nil;
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)view;
        if (!label.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    } else if ([view isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)view;
        if (!button.titleLabel.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    }
    
    // 设置颜色
    if (color) {
        for (int i=0; i<rangeArray.count; i++) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[rangeArray[i] rangeValue]];
        }
    }
    
    // 设置尺寸
    if (fontSize) {
        for (int i=0; i<rangeArray.count; i++) {
            [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:[rangeArray[i] rangeValue]];
        }
    }
    
    // 设置下划线
    if (underlineStyle) {
        for (int i=0; i<rangeArray.count; i++) {
            [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:underlineStyle] range:[rangeArray[i] rangeValue]];
        }
    }

    if ([view isKindOfClass:[UILabel class]]) {   // 设置label文字属性
        ((UILabel *)view).attributedText = attributedString;
    } else {                                      // 设置按钮文字属性
        [(UIButton *)view setAttributedTitle:attributedString forState:UIControlStateNormal];
    }
}
/**
 *  设置label或button的若干个范围内的文字大小
 */
+ (void)properFont:(CGFloat)fontSize withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray {
    [self properFont:fontSize color:nil underlineStyle:NSUnderlineStyleNone withView:view rangeArray:rangeArray];
}

/**
 *  设置label或button若干个范围内的颜色
 */
+ (void)properColor:(UIColor *)color withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray {
    [self properFont:0.0 color:color underlineStyle:NSUnderlineStyleNone withView:view rangeArray:rangeArray];
}

/**
 *  设置label或button若干个范围内的文字下划线
 */
+ (void)properUnderlineStyleSingleWithView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray {
    [self properFont:0.0 color:nil underlineStyle:NSUnderlineStyleSingle withView:view rangeArray:rangeArray];
}

/**
 *  设置label或button的若干个范围内的富文本文字属性
 */
+ (void)properView:(UIView *)view rangeDictArray:(NSArray<NSDictionary *> *)rangeDictArray {
    NSMutableAttributedString *attributedString = nil;
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)view;
        if (!label.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    } else if ([view isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)view;
        if (!button.titleLabel.text) return;
        attributedString = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    }
    
    for (int i=0; i<rangeDictArray.count; i++) {
        
        NSArray *keys = [rangeDictArray[i] allKeys];
        for (NSString *key in keys) {
            // 设置文字颜色
            if ([key isEqualToString:COLORKEY]) {
                [attributedString addAttribute:NSForegroundColorAttributeName value:rangeDictArray[i][COLORKEY] range:[rangeDictArray[i][RANGEKEY] rangeValue]];
            }
            // 设置文字大小
            if ([key isEqualToString:FONTKEY]) {
                [attributedString addAttribute:NSFontAttributeName value:rangeDictArray[i][FONTKEY] range:[rangeDictArray[i][RANGEKEY] rangeValue]];
            }
            // 设置文字划线风格
            if ([key isEqualToString:UNDERLINESTYLEKEY]) {
                [attributedString addAttribute:NSUnderlineStyleAttributeName value:rangeDictArray[i][UNDERLINESTYLEKEY] range:[rangeDictArray[i][RANGEKEY] rangeValue]];
            }
        }
        
    }
    
    if ([view isKindOfClass:[UILabel class]]) {   // 设置label文字属性
        ((UILabel *)view).attributedText = attributedString;
    } else {                                      // 设置按钮文字属性
        [(UIButton *)view setAttributedTitle:attributedString forState:UIControlStateNormal];
    }
}

@end
