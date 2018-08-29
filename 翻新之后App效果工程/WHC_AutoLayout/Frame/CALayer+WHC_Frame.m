//
//  CALayer+WHC_Frame.m
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2017/12/5.
//  Copyright © 2017年 吴海超. All rights reserved.
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "CALayer+WHC_Frame.h"

@implementation CALayer (WHC_Frame)
#if TARGET_OS_IPHONE || TARGET_OS_TV
- (CGFloat)whc_sw {
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}

- (CGFloat)whc_sh {
    return CGRectGetHeight([UIScreen mainScreen].bounds);
}

#elif TARGET_OS_MAC
- (CGFloat)whc_sw {
    return CGRectGetWidth([NSScreen mainScreen].frame);
}

- (CGFloat)whc_sh {
    return CGRectGetHeight([NSScreen mainScreen].frame);
}
#endif
- (void)setWhc_w:(CGFloat)whc_w {
    CGRect rect = self.frame;
    rect.size.width = whc_w;
    self.frame = rect;
}

- (CGFloat)whc_w {
    return CGRectGetWidth(self.frame);
}

- (void)setWhc_h:(CGFloat)whc_h {
    CGRect rect = self.frame;
    rect.size.height = whc_h;
    self.frame = rect;
}

- (CGFloat)whc_h {
    return CGRectGetHeight(self.frame);
}

- (void)setWhc_x:(CGFloat)whc_x {
    CGRect rect = self.frame;
    rect.origin.x = whc_x;
    self.frame = rect;
}

- (CGFloat)whc_x {
    return CGRectGetMinX(self.frame);
}

- (void)setWhc_y:(CGFloat)whc_y {
    CGRect rect = self.frame;
    rect.origin.y = whc_y;
    self.frame = rect;
}

- (CGFloat)whc_y {
    return CGRectGetMinY(self.frame);
}

- (void)setWhc_maxX:(CGFloat)whc_maxX {
    self.whc_w = whc_maxX - self.whc_x;
}

- (CGFloat)whc_maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)setWhc_maxY:(CGFloat)whc_maxY {
    self.whc_h = whc_maxY - self.whc_y;
}

- (CGFloat)whc_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setWhc_midX:(CGFloat)whc_midX {
    self.whc_w = whc_midX * 2;
}

- (CGFloat)whc_midX {
    return CGRectGetMinX(self.frame) + CGRectGetWidth(self.frame) / 2;
}

- (void)setWhc_midY:(CGFloat)whc_midY {
    self.whc_h = whc_midY * 2;
}

- (CGFloat)whc_midY {
    return CGRectGetMinY(self.frame) + CGRectGetHeight(self.frame) / 2;
}

- (void)setWhc_ax:(CGFloat)whc_ax {
    CGPoint anchor = self.anchorPoint;
    anchor.x = whc_ax;
    self.anchorPoint = anchor;
}

- (CGFloat)whc_ax {
    return self.anchorPoint.x;
}

- (void)setWhc_ay:(CGFloat)whc_ay {
    CGPoint anchor = self.anchorPoint;
    anchor.y = whc_ay;
    self.anchorPoint = anchor;
}

- (CGFloat)whc_ay {
    return self.anchorPoint.y;
}

- (void)setWhc_xy:(CGPoint)whc_xy {
    CGRect rect = self.frame;
    rect.origin = whc_xy;
    self.frame = rect;
}


- (CGPoint)whc_xy {
    return self.frame.origin;
}

- (void)setWhc_s:(CGSize)whc_s {
    CGRect rect = self.frame;
    rect.size = whc_s;
    self.frame = rect;
}

- (CGSize)whc_s {
    return self.frame.size;
}
@end
