//
//  UIView+WHC_ViewProperty.h
//  WHC_ ContainerView
//
//  Created by 吴海超 on 15/5/15.
//  Copyright (c) 2015年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import <UIKit/UIKit.h>

@interface UIView (WHC_ViewProperty)

//! 获取屏幕宽度
- (CGFloat)screenWidth;

//! 获取屏幕高度
- (CGFloat)screenHeight;

//! 获取当前屏幕与4s屏幕的宽度比
- (CGFloat)screenWidthRadio;

//! 获取当前屏幕与4s屏幕的高度比
- (CGFloat)screenHeightRadio;

//! 获取y坐标
- (CGFloat)y;

//! 获取中心点y坐标
- (CGFloat)centerY;

//! 获取中心点x坐标
- (CGFloat)centerX;

//! 获取最大y坐标
- (CGFloat)maxY;

//! 获取y坐标
- (CGFloat)x;

//! 获取最大x坐标
- (CGFloat)maxX;

//! 获取xy坐标
- (CGPoint)xy;

//! 获取宽度
- (CGFloat)width;

//! 获取高度
- (CGFloat)height;

//! 获取尺寸
- (CGSize)size;

//! 设置最大y坐标
- (void)setMaxY:(CGFloat)maxY;

//! 设置最大x坐标
- (void)setMaxX:(CGFloat)maxX;

//! 设置y坐标
- (void)setY:(CGFloat)Y;

//! 设置x坐标
- (void)setX:(CGFloat)X;

//! 设置中心的x坐标
- (void)setCenterX:(CGFloat)centerX;

//! 设置中心的y坐标
- (void)setCenterY:(CGFloat)centerY;

//! 设置xy坐标
- (void)setXy:(CGPoint)point;

//! 设置尺寸大小
- (void)setSize:(CGSize)size;

//! 设置宽度
- (void)setWidth:(CGFloat)width;

//! 设置高度
- (void)setHeight:(CGFloat)height;

@end
