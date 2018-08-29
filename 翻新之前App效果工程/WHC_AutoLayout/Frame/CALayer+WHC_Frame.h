//
//  CALayer+WHC_Frame.h
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

#import "WHC_AutoLayoutUtilities.h"

@interface CALayer (WHC_Frame)
/// 获取屏幕宽度
@property (nonatomic, assign, readonly)CGFloat whc_sw;
/// 获取屏幕高度
@property (nonatomic, assign, readonly)CGFloat whc_sh;
/// 获取视图层宽度
@property (nonatomic, assign)CGFloat whc_w;
/// 获取视图层高度
@property (nonatomic, assign)CGFloat whc_h;
/// 获取视图层x
@property (nonatomic, assign)CGFloat whc_x;
/// 获取视图层y
@property (nonatomic, assign)CGFloat whc_y;
/// 获取视图层最大x
@property (nonatomic, assign)CGFloat whc_maxX;
/// 获取视图层最大y
@property (nonatomic, assign)CGFloat whc_maxY;
/// 获取视图层中间x
@property (nonatomic, assign)CGFloat whc_midX;
/// 获取视图层中间y
@property (nonatomic, assign)CGFloat whc_midY;
/// 获取视图层中心锚点x
@property (nonatomic, assign)CGFloat whc_ax;
/// 获取视图层中心锚点y
@property (nonatomic, assign)CGFloat whc_ay;
/// 获取视图层xy
@property (nonatomic, assign)CGPoint whc_xy;
/// 获取视图层size
@property (nonatomic, assign)CGSize  whc_s;
@end
