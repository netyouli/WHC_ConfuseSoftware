//
//  UIView+WHC_Frame.h
//  Github <https://github.com/netyouli/WHC_AutoLayoutKit>
//
//  Created by 吴海超 on 16/2/17.
//  Copyright © 2016年 吴海超. All rights reserved.
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

@interface WHC_CLASS_VIEW (WHC_Frame)

/// 获取屏幕宽度
@property (nonatomic, assign, readonly)CGFloat whc_sw;
/// 获取屏幕高度
@property (nonatomic, assign, readonly)CGFloat whc_sh;
/// 获取视图宽度
@property (nonatomic, assign)CGFloat whc_w;
/// 获取视图高度
@property (nonatomic, assign)CGFloat whc_h;
/// 获取视图x
@property (nonatomic, assign)CGFloat whc_x;
/// 获取视图y
@property (nonatomic, assign)CGFloat whc_y;
/// 获取视图最大x
@property (nonatomic, assign)CGFloat whc_maxX;
/// 获取视图最大y
@property (nonatomic, assign)CGFloat whc_maxY;
/// 获取视图中间x
@property (nonatomic, assign)CGFloat whc_midX;
/// 获取视图中间y
@property (nonatomic, assign)CGFloat whc_midY;
#if TARGET_OS_IPHONE || TARGET_OS_TV
/// 获取视图中心x
@property (nonatomic, assign)CGFloat whc_cx;
/// 获取视图中心y
@property (nonatomic, assign)CGFloat whc_cy;
#endif
/// 获取视图xy
@property (nonatomic, assign)CGPoint whc_xy;
/// 获取视图size
@property (nonatomic, assign)CGSize  whc_s;
@end
