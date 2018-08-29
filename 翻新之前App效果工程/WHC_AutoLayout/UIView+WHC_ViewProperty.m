//
//  UIView+WHC_ViewProperty.m
//  WHC_ ContainerView
//
//  Created by 吴海超 on 15/5/15.
//  Copyright (c) 2015年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "UIView+WHC_ViewProperty.h"

@implementation UIView (WHC_ViewProperty)

- (CGFloat)screenWidth{
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}

- (CGFloat)screenHeight{
    return CGRectGetHeight([UIScreen mainScreen].bounds);
}

- (CGFloat)screenWidthRadio{
    return [self screenWidth] / 320.0;
}

- (CGFloat)screenHeightRadio{
    return [self screenHeight] / 480.0;
}

- (CGFloat)y{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)maxY{
    return self.y + self.height;
}

- (void)setMaxY:(CGFloat)maxY{
    CGFloat  y = maxY - self.height;
    self.y = y;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint  center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint  center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)x{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)maxX{
    return self.x + self.width;
}

- (void)setMaxX:(CGFloat)maxX{
    CGFloat  x = maxX - self.width;
    self.x = x;
}

- (CGPoint)xy{
    return CGPointMake(self.x, self.y);
}

- (CGFloat)width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height{
    return CGRectGetHeight(self.frame);
}

- (CGSize)size{
    return CGSizeMake(self.width, self.height);
}

- (void)setY:(CGFloat)Y{
    CGRect   rc = self.frame;
    rc.origin.y = Y;
    self.frame = rc;
}

- (void)setX:(CGFloat)X{
    CGRect   rc = self.frame;
    rc.origin.x = X;
    self.frame = rc;
}

- (void)setXy:(CGPoint)point{
    CGRect   rc = self.frame;
    rc.origin = point;
    self.frame = rc;
}

- (void)setSize:(CGSize)size{
    CGRect   rc = self.frame;
    rc.size = size;
    self.frame = rc;
}

- (void)setWidth:(CGFloat)width{
    CGRect   rc = self.frame;
    rc.size.width = width;
    self.frame = rc;
}

- (void)setHeight:(CGFloat)height{
    CGRect   rc = self.frame;
    rc.size.height = height;
    self.frame = rc;
}
@end
