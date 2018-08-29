//
//  WHC_StackView.h
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
#import "UIView+WHC_AutoLayout.h"

/// 布局方向
typedef NS_OPTIONS(NSUInteger, WHC_LayoutOrientationOptions) {
    /// 垂直布局
    Vertical = 1 << 0,
    /// 横向布局
    Horizontal = 1 << 1,
    /// 垂直布局和横向布局
    All = 1 << 2
};

#pragma mark - UI自动布局StackView容器 -

@interface WHC_CLASS_VIEW (WHC_StackViewCategory)
/**
 控件横向和垂直布局宽度或者高度权重比例
 */
@property (nonatomic , assign)CGFloat whc_WidthWeight;

@property (nonatomic , assign)CGFloat whc_HeightWeight;
@end

@interface WHC_StackView : WHC_CLASS_VIEW



/// 混合布局(同时垂直和横向)每行多少列
@property (nonatomic , assign) NSInteger whc_Column;
/// 容器内边距
#if TARGET_OS_IPHONE || TARGET_OS_TV
@property (nonatomic , assign) UIEdgeInsets whc_Edge;
#elif TARGET_OS_MAC
@property (nonatomic , assign) NSEdgeInsets whc_Edge;
#endif
/// 容器内子控件横向间隙
@property (nonatomic , assign) CGFloat whc_HSpace;
/// 容器内子控件垂直间隙
@property (nonatomic , assign) CGFloat whc_VSpace;

/// 子元素高宽比
@property (nonatomic , assign) CGFloat whc_ElementHeightWidthRatio;

/// 子元素宽高比
@property (nonatomic , assign) CGFloat whc_ElementWidthHeightRatio;

/// 容器里子元素实际数量
@property (nonatomic , assign , readonly) NSInteger whc_SubViewCount;

/// 容器自动布局方向
@property (nonatomic , assign) WHC_LayoutOrientationOptions whc_Orientation;

/// 子视图固定宽度
@property (nonatomic , assign) CGFloat whc_SubViewWidth;

/// 子视图固定高度
@property (nonatomic , assign) CGFloat whc_SubViewHeight;

/// 设置分割线尺寸
@property (nonatomic , assign) CGFloat whc_SegmentLineSize;
/// 设置分割线内边距
@property (nonatomic , assign) CGFloat whc_SegmentLinePadding;
/// 设置分割线的颜色
@property (nonatomic , strong) WHC_COLOR * whc_SegmentLineColor;
/************重载父类属性**************/
/// 自动高度
@property (nonatomic ,copy , readonly)HeightAuto whc_HeightAuto;

/// 自动宽度
@property (nonatomic ,copy , readonly)WidthAuto whc_WidthAuto;

/// 元素集合
@property (nonatomic, strong, readonly)NSArray<WHC_CLASS_VIEW *> * whc_Subviews;

/************重载父类方法**************/
/**
 自动宽度
 */

- (void)whc_AutoWidth;

/**
 自动高度
 */

- (void)whc_AutoHeight;

/**
 开始进行自动布局
 */
- (void)whc_StartLayout;

/**
 清除所有子视图
 */
- (void)whc_RemoveAllSubviews;

/**
 移除所有空白站位视图(仅仅横向垂直混合布局有效)
 */
- (void)whc_RemoveAllVacntView;
@end

