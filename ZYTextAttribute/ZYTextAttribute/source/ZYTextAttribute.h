//
//  ZYTextAttribute.h
//  PKA
//
//  Created by 郑遥 on 15/6/16.
//  Copyright (c) 2015年 JPY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString * const RANGEKEY;
UIKIT_EXTERN NSString * const COLORKEY;
UIKIT_EXTERN NSString * const FONTKEY;
UIKIT_EXTERN NSString * const UNDERLINESTYLEKEY;

@interface ZYTextAttribute : NSObject

/**
 *  设置label或button的某个范围内的文字属性
 */
+ (void)properFont:(CGFloat)fontSize color:(UIColor *)color underlineStyle:(NSUnderlineStyle)underlineStyle withView:(UIView *)view range:(NSRange)range;

/**
 *  设置label或button某个范围内的文字大小
 */
+ (void)properFont:(CGFloat)fontSize withView:(UIView *)view range:(NSRange)range;

/**
 *  设置label或button某个范围内的颜色
 */
+ (void)properColor:(UIColor *)color withView:(UIView *)view range:(NSRange)range;

/**
 *  设置label或button某个范围内文字下划线
 */
+ (void)properUnderlineStyleSingleWithView:(UIView *)view range:(NSRange)range;

#pragma mark - 增加多个范围文字设置  add by zhengyao
/**
 *  设置label或button的若干个范围内的文字属性
 */
+ (void)properFont:(CGFloat)fontSize color:(UIColor *)color underlineStyle:(NSUnderlineStyle)underlineStyle withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray;

/**
 *  设置label或button若干个范围内的文字大小
 */
+ (void)properFont:(CGFloat)fontSize withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray;

/**
 *  设置label或button若干个范围内的颜色
 */
+ (void)properColor:(UIColor *)color withView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray;

/**
 *  设置label或button若干个范围内文字下划线
 */
+ (void)properUnderlineStyleSingleWithView:(UIView *)view rangeArray:(NSArray<NSValue *> *)rangeArray;

/**
 *  设置label或button的若干个范围内的富文本文字属性
 */
+ (void)properView:(UIView *)view rangeDictArray:(NSArray<NSDictionary *> *)rangeDictArray;

@end
