//
//  WHC_VIEW+WHC_AutoLayout.h
//
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

typedef WHC_CLASS_VIEW * (^IsSafe)(BOOL);

typedef WHC_CLASS_VIEW * (^LessOrEqual)(void);
typedef WHC_CLASS_VIEW * (^GreaterOrEqual)(void);
typedef WHC_CLASS_VIEW * (^ResetConstraintAttribute)(void);
typedef WHC_CLASS_VIEW * (^ClearConstraintAttribute)(void);
typedef WHC_CLASS_VIEW * (^RemoveConstraintAttribute)(NSLayoutAttribute attributes, ...);
typedef WHC_CLASS_VIEW * (^RemoveConstraintFromViewAttribute)(WHC_CLASS_VIEW * view, NSLayoutAttribute attributes, ...);
typedef WHC_CLASS_VIEW * (^RemoveConstraintToViewAttribute)(WHC_VIEW * toView, NSLayoutAttribute attributes, ...);

typedef WHC_CLASS_VIEW * (^PriorityLow)(void);
typedef WHC_CLASS_VIEW * (^PriorityHigh)(void);
typedef WHC_CLASS_VIEW * (^PriorityRequired)(void);
typedef WHC_CLASS_VIEW * (^PriorityFitting)(void);
typedef WHC_CLASS_VIEW * (^PriorityValue)(CGFloat value);

typedef WHC_CLASS_VIEW * (^ContentHuggingPriority)(WHC_LayoutPriority, WHC_ConstraintAxis);
typedef WHC_CLASS_VIEW * (^ContentCompressionResistancePriority)(WHC_LayoutPriority, WHC_ConstraintAxis);

typedef WHC_CLASS_VIEW * (^LeftSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^LeftSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^LeftSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^LeftSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^LeadingSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^LeadingSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^LeadingSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^LeadingSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^TrailingSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^TrailingSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^TrailingSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^TrailingSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^BaseLineSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^BaseLineSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^BaseLineSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^BaseLineSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^RightSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^RightSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^RightSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^RightSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^TopSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^TopSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^TopSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^TopSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^BottomSpace)(CGFloat value);
typedef WHC_CLASS_VIEW * (^BottomSpaceToView)(CGFloat value , WHC_VIEW * toView);
typedef WHC_CLASS_VIEW * (^BottomSpaceEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^BottomSpaceEqualViewOffset)(WHC_VIEW * view, CGFloat offset);

typedef WHC_CLASS_VIEW * (^Width)(CGFloat value);
typedef WHC_CLASS_VIEW * (^WidthAuto)(void);
typedef WHC_CLASS_VIEW * (^WidthEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^WidthEqualViewRatio)(WHC_VIEW * view, CGFloat ratio);
typedef WHC_CLASS_VIEW * (^WidthHeightRatio)(CGFloat ratio);

typedef WHC_CLASS_VIEW * (^Height)(CGFloat value);
typedef WHC_CLASS_VIEW * (^HeightAuto)(void);
typedef WHC_CLASS_VIEW * (^HeightEqualView)(WHC_VIEW * view);
typedef WHC_CLASS_VIEW * (^HeightEqualViewRatio)(WHC_VIEW * view, CGFloat ratio);
typedef WHC_CLASS_VIEW * (^HeightWidthRatio)(CGFloat ratio);

typedef WHC_CLASS_VIEW * (^CenterX)(CGFloat value);
typedef WHC_CLASS_VIEW * (^CenterXToView)(CGFloat value, WHC_VIEW * toView);

typedef WHC_CLASS_VIEW * (^CenterY)(CGFloat value);
typedef WHC_CLASS_VIEW * (^CenterYToView)(CGFloat value, WHC_VIEW * toView);

typedef WHC_CLASS_VIEW * (^Center)(CGFloat x, CGFloat y);
typedef WHC_CLASS_VIEW * (^CenterToView)(CGPoint center, WHC_VIEW * toView);

typedef WHC_CLASS_VIEW * (^size)(CGFloat width, CGFloat height);
typedef WHC_CLASS_VIEW * (^SizeEqual)(WHC_VIEW * view);

typedef WHC_CLASS_VIEW * (^FrameEqual)(WHC_VIEW * view);

#pragma mark - UI自动布局 -

@interface WHC_CLASS_VIEW (WHC_AutoLayout)

#pragma mark - api version ~ 2.0 -

/// 是否安全布局
@property (nonatomic ,copy , readonly)IsSafe whc_IsSafe;

/// 当前约束小于等于
@property (nonatomic ,copy , readonly)LessOrEqual whc_LessOrEqual;
/// 当前约束大于等于
@property (nonatomic ,copy , readonly)GreaterOrEqual whc_GreaterOrEqual;
/// 重置缓存约束
@property (nonatomic ,copy , readonly)ResetConstraintAttribute whc_ResetConstraint;
/// 清除所有约束
@property (nonatomic ,copy , readonly)ClearConstraintAttribute whc_ClearLayoutAttr;
/// 移除约束(NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintAttribute whc_RemoveLayoutAttrs;
/// 移除约束从指定视图上(WHC_VIEW * view, NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintFromViewAttribute whc_RemoveFromLayoutAttrs;
/// 移除约束从关联视图上(WHC_VIEW * toView, NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintToViewAttribute whc_RemoveToLayoutAttrs;

/// 设置当前约束的低优先级
@property (nonatomic ,copy , readonly)PriorityLow whc_PriorityLow;
/// 设置当前约束的高优先级
@property (nonatomic ,copy , readonly)PriorityHigh whc_PriorityHigh;
/// 设置当前约束的默认优先级
@property (nonatomic ,copy , readonly)PriorityRequired whc_PriorityRequired;
/// 设置当前约束的合适优先级
@property (nonatomic ,copy , readonly)PriorityFitting whc_PriorityFitting;
/// 设置当前约束的优先级 (CGFloat value): 优先级大小(0-1000)
@property (nonatomic ,copy , readonly)PriorityValue whc_Priority;

/// 设置视图抗拉伸优先级,优先级越高越不容易被拉伸(UILayoutPriority, UILayoutConstraintAxis)
@property (nonatomic ,copy, readonly)ContentHuggingPriority whc_ContentHuggingPriority;
/// 设置视图抗压缩优先级,优先级越高越不容易被压缩(UILayoutPriority, UILayoutConstraintAxis)
@property (nonatomic ,copy, readonly)ContentCompressionResistancePriority whc_ContentCompressionResistancePriority;

/// 与父视图左边间距(CGFloat value)
@property (nonatomic ,copy , readonly)LeftSpace whc_LeftSpace;
/// 与相对视图toView左边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)LeftSpaceToView whc_LeftSpaceToView;
/// 与视图view左边间距相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)LeftSpaceEqualView whc_LeftSpaceEqualView;
/// 与视图view左边间距相等并偏移offset(WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)LeftSpaceEqualViewOffset whc_LeftSpaceEqualViewOffset;

/// 与父视图左边间距(CGFloat value)
@property (nonatomic ,copy , readonly)LeadingSpace whc_LeadingSpace;
/// 与相对视图toView左边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)LeadingSpaceToView whc_LeadingSpaceToView;
/// 与视图view左边间距相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)LeadingSpaceEqualView whc_LeadingSpaceEqualView;
/// 与视图view左边间距相等并偏移offset (WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)LeadingSpaceEqualViewOffset whc_LeadingSpaceEqualViewOffset;

/// 与父视图右边间距(CGFloat value)
@property (nonatomic ,copy , readonly)TrailingSpace whc_TrailingSpace;
/// 与相对视图toView右边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)TrailingSpaceToView whc_TrailingSpaceToView;
/// 与视图view右边间距相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)TrailingSpaceEqualView whc_TrailingSpaceEqualView;
/// 与视图view右边间距相等并偏移offset(WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)TrailingSpaceEqualViewOffset whc_TrailingSpaceEqualViewOffset;

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
/// 与父视图底边间距Y(CGFloat value)
@property (nonatomic ,copy , readonly)BaseLineSpace whc_FirstBaseLine;
/// 与相对视图toView底边间距Y(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)BaseLineSpaceToView whc_FirstBaseLineToView;
/// 与视图view底边间距Y相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualView whc_FirstBaseLineEqualView;
/// 与视图view底边间距Y相等并偏移offset(WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualViewOffset whc_FirstBaseLineEqualViewOffset;
#endif

/// 与父视图底边间距Y(CGFloat value)
@property (nonatomic ,copy , readonly)BaseLineSpace whc_LastBaseLine;
/// 与相对视图toView底边间距Y(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)BaseLineSpaceToView whc_LastBaseLineToView;
/// 与视图view底边间距Y相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualView whc_LastBaseLineEqualView;
/// 与视图view底边间距Y相等并偏移offset(WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualViewOffset whc_LastBaseLineEqualViewOffset;
/// 与父视图右边间距(CGFloat value)
@property (nonatomic ,copy , readonly)RightSpace whc_RightSpace;
/// 与相对视图toView右边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)RightSpaceToView whc_RightSpaceToView;
/// 与相对视图toView右边间距相等(WHC_VIEW toView)
@property (nonatomic ,copy , readonly)RightSpaceEqualView whc_RightSpaceEqualView;
/// 与相对视图toView右边间距相等并偏移offset(WHC_VIEW toView, CGFloat offset)
@property (nonatomic ,copy , readonly)RightSpaceEqualViewOffset whc_RightSpaceEqualViewOffset;

/// 与父视图顶边间距(CGFloat value)
@property (nonatomic ,copy , readonly)TopSpace whc_TopSpace;
/// 与相对视图toView顶边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)TopSpaceToView whc_TopSpaceToView;
/// 与视图view顶边间距相等(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)TopSpaceEqualView whc_TopSpaceEqualView;
/// 与视图view顶边间距相等并偏移offset(WHC_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)TopSpaceEqualViewOffset whc_TopSpaceEqualViewOffset;

/// 与父视图底边间距(CGFloat value)
@property (nonatomic ,copy , readonly)BottomSpace whc_BottomSpace;
/// 与相对视图toView底边间距(CGFloat value,WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)BottomSpaceToView whc_BottomSpaceToView;
/// 与相对视图toView底边间距相等(WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)BottomSpaceEqualView whc_BottomSpaceEqualView;
/// 与相对视图toView底边间距相等并偏移offset(WHC_VIEW * toView, CGFloat offset)
@property (nonatomic ,copy , readonly)BottomSpaceEqualViewOffset whc_BottomSpaceEqualViewOffset;

/// 宽度(CGFloat value)
@property (nonatomic ,copy , readonly)Width whc_Width;
/// 宽度自动()
@property (nonatomic ,copy , readonly)WidthAuto whc_WidthAuto;
/// 宽度等于视图view(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)WidthEqualView whc_WidthEqualView;
/// 宽度等于视图view 参照比例Ratio(WHC_VIEW * view ,CGFloat ratio)
@property (nonatomic ,copy , readonly)WidthEqualViewRatio whc_WidthEqualViewRatio;
/// 视图自身宽度与高度的比(CGFloat Ratio)
@property (nonatomic ,copy , readonly)WidthHeightRatio whc_WidthHeightRatio;

/// 高度(CGFloat value)
@property (nonatomic ,copy , readonly)Height whc_Height;
/// 高度自动()
@property (nonatomic ,copy , readonly)HeightAuto whc_HeightAuto;
/// 高度等于视图view(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)HeightEqualView whc_HeightEqualView;
/// 高度等于视图view 参照比例Ratio(WHC_VIEW * view ,CGFloat ratio)
@property (nonatomic ,copy , readonly)HeightEqualViewRatio whc_HeightEqualViewRatio;
/// 视图自身高度与宽度的比(CGFloat Ratio)
@property (nonatomic ,copy , readonly)HeightWidthRatio whc_HeightWidthRatio;

/// 中心X与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)CenterX whc_CenterX;
/// 中心X与视图view偏移(CGFloat value , WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterXToView whc_CenterXToView;

/// 中心Y与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)CenterY whc_CenterY;
/// 中心Y与视图view偏移(CGFloat value , WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterYToView whc_CenterYToView;

/// 中心与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)Center whc_Center;
/// 中心与视图view偏移(CGFloat value , WHC_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterToView whc_CenterToView;

/// size设置(CGFloat width, CGFloat height)
@property (nonatomic ,copy , readonly)size whc_Size;
/// size设置(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)SizeEqual whc_SizeEqualView;

/// frame设置(WHC_VIEW * view)
@property (nonatomic ,copy , readonly)FrameEqual whc_FrameEqualView;
#pragma mark - api version ~ 1.0 -


/**
 是否进行安全布局

 @param safe 是否安全
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_IsSafe:(BOOL)safe;


/**
 重置缓存的约束,该方法在当前视图对象移除从父视图上可能需要调用清除与父视图之前旧约束缓存对象
 
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_ResetConstraints;

/**
 清除所有布局属性
 
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_ClearLayoutAttrs;

/**
 移除一个或者一组约束
 
 @param attributes 约束类型（可变参数）
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RemoveLayoutAttr:(NSLayoutAttribute)attributes, ...;


/**
 移除一个单个属性

 @param attribute 约束类型
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RemoveLayoutOneAttr:(NSLayoutAttribute)attribute;

/**
 移除一个或者一组约束从指定的视图上

 @param view 指定视图
 @param attributes 约束类型（可变参数）
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RemoveFrom:(WHC_CLASS_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ...;


/**
 移除一个约束从指定的视图上

 @param view 指定视图
 @param attribute 约束类型
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RemoveFrom:(WHC_CLASS_VIEW *)view layoutAttr:(NSLayoutAttribute)attribute;


/**
 移除一个约束从关联的视图

 @param view 关联的视图
 @param attribute 移除的约束
 @return 当前视图
 */
- (WHC_CLASS_VIEW *)whc_RemoveTo:(WHC_VIEW *)view attr:(NSLayoutAttribute)attribute;

/**
 移除多个约束从关联的视图
 
 @param view 关联的视图
 @param attributes 移除的约束
 @return 当前视图
 */

- (WHC_CLASS_VIEW *)whc_RemoveTo:(WHC_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... ;

/**
 设置当前约束的低优先级

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_priorityLow;

/**
 设置当前约束的高优先级

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_priorityHigh;

/**
 设置当前约束的默认优先级

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_priorityRequired;

/**
 设置当前约束的合适优先级

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_priorityFitting;

/**
 设置当前约束的优先级

 @param value 优先级大小(0-1000)
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_priority:(CGFloat)value;

/**
 设置左边距(默认相对父视图)

 @param leftSpace 左边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeftSpace:(CGFloat)leftSpace;


/**
 设置左边距

 @param leftSpace 左边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeftSpace:(CGFloat)leftSpace toView:(WHC_VIEW *)toView;

/**
 设置左边距与视图view左边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeftSpaceEqualView:(WHC_VIEW *)view;

/**
 设置左边距与视图view左边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeftSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置右边距(默认相对父视图)

 @param rightSpace 右边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RightSpace:(CGFloat)rightSpace;

/**
 设置右边距

 @param rightSpace 右边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RightSpace:(CGFloat)rightSpace toView:(WHC_VIEW *)toView;

/**
 设置右边距与视图view左对齐边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RightSpaceEqualView:(WHC_VIEW *)view;

/**
 设置右边距与视图view左对齐边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_RightSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置左对齐(默认相对父视图)

 @param leadingSpace 左边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeadingSpace:(CGFloat)leadingSpace;

/**
 设置左对齐
 
 @param leadingSpace 左边距
 @param toView 相对视图
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_LeadingSpace:(CGFloat)leadingSpace toView:(WHC_VIEW *)toView;

/**
 设置左对齐边距与某视图左对齐边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeadingSpaceEqualView:(WHC_VIEW *)view;

/**
 设置左对齐边距与某视图左对齐边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LeadingSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置右对齐(默认相对父视图)

 @param trailingSpace 右边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TrailingSpace:(CGFloat)trailingSpace;

/**
 设置右对齐

 @param trailingSpace 右边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TrailingSpace:(CGFloat)trailingSpace toView:(WHC_VIEW *)toView;

/**
 设置右对齐边距与某视图右对齐边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TrailingSpaceEqualView:(WHC_VIEW *)view;

/**
 设置右对齐边距与某视图右对齐边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TrailingSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置顶边距(默认相对父视图)

 @param topSpace 顶边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TopSpace:(CGFloat)topSpace;

/**
 设置顶边距

 @param topSpace 顶边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TopSpace:(CGFloat)topSpace toView:(WHC_VIEW *)toView;

/**
 设置顶边距与视图view顶边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TopSpaceEqualView:(WHC_VIEW *)view;

/**
 设置顶边距与视图view顶边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_TopSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置底边距(默认相对父视图)

 @param bottomSpace 底边距
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_BottomSpace:(CGFloat)bottomSpace;

/**
 设置底边距

 @param bottomSpace 底边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_BottomSpace:(CGFloat)bottomSpace toView:(WHC_VIEW *)toView;

/**
 设置底边距与视图view底边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_BottomSpaceEqualView:(WHC_VIEW *)view;

/**
 设置底边距与视图view底边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_BottomSpaceEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

/**
 设置宽度

 @param width 宽度
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_Width:(CGFloat)width;

/**
 设置宽度与某个视图相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_WidthEqualView:(WHC_VIEW *)view;

/**
 设置宽度与视图view相等

 @param view 相对视图
 @param ratio 比例
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_WidthEqualView:(WHC_VIEW *)view ratio:(CGFloat)ratio;

/**
 设置自动宽度

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_AutoWidth;

/**
 设置视图自身宽度与高度的比

 @param ratio 比例
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_WidthHeightRatio:(CGFloat)ratio;

/**
 设置高度

 @param height 高度
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_Height:(CGFloat)height;

/**
 设置高度与视图view相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_HeightEqualView:(WHC_VIEW *)view;

/**
 设置高度与视图view相等

 @param view 相对视图
 @param ratio 比例
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_HeightEqualView:(WHC_VIEW *)view ratio:(CGFloat)ratio;

/**
 设置自动高度

 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_AutoHeight;

/**
 设置视图自身高度与宽度的比

 @param ratio 比例
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_HeightWidthRatio:(CGFloat)ratio;

/**
 设置中心x与父视图中心的偏移 centerX = 0 与父视图中心x重合

 @param centerX 中心x坐标偏移
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_CenterX:(CGFloat)centerX;

/**
 设置中心x与相对视图中心的偏移 centerX = 0 与相对视图中心x重合

 @param centerX 中心x坐标偏移
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_CenterX:(CGFloat)centerX toView:(WHC_VIEW *)toView;

/**
 设置中心y与父视图中心的偏移 centerY = 0 与父视图中心y重合

 @param centerY 中心y坐标偏移
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_CenterY:(CGFloat)centerY;

/**
 设置中心y与相对视图中心的偏移 centerY = 0 与相对视图中心y重合

 @param centerY 中心y坐标偏移
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_CenterY:(CGFloat)centerY toView:(WHC_VIEW *)toView;

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
/**
 设置顶部基线偏移(默认相对父视图)

 @param space 间隙
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_FirstBaseLine:(CGFloat)space;

/**
 设置顶部基线与对象视图底部基线偏移

 @param space 间隙
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_FirstBaseLine:(CGFloat)space toView:(WHC_VIEW *)toView;

/**
 设置顶部基线与相对视图顶部基线相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_FirstBaseLineEqualView:(WHC_VIEW *)view;

/**
 设置顶部基线与相对视图顶部基线相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_FirstBaseLineEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;

#endif

/**
 设置底部基线偏移(默认相对父视图)

 @param space 间隙
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LastBaseLine:(CGFloat)space;

/**
 设置底部基线与对象视图顶部基线偏移

 @param space 间隙
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LastBaseLine:(CGFloat)space toView:(WHC_VIEW *)toView;

/**
 设置底部基线与相对视图底部基线相等

 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LastBaseLineEqualView:(WHC_VIEW *)view;

/**
 设置底部基线与相对视图底部基线相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_LastBaseLineEqualView:(WHC_VIEW *)view offset:(CGFloat)offset;


/**
 设置中心偏移(默认相对父视图)center = CGPointZero 与父视图中心重合

 @param center 中心偏移xy
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_Center:(CGPoint)center;

/**
 设置中心偏移(默认相对父视图)center = CGPointZero 与父视图中心重合

 @param center 中心偏移xy
 @param toView 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_Center:(CGPoint)center toView:(WHC_VIEW *)toView;


/**
 设置frame(默认相对父视图)

 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param height 高度
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param bottom 底边距
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param height 高度
 @param toView 相对视图
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height toView:(WHC_VIEW *)toView;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param height 高度
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param bottom 底边距
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param bottom 底边距
 @param toView 相对视图
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom toView:(WHC_VIEW *)toView;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param height 高度
 @param toView 相对视图
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height toView:(WHC_VIEW *)toView;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param bottom 底边距
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom toView:(WHC_VIEW *)toView;

/**
 设置视图显示宽高
 
 @param size 视图宽高
 @return 返回当前视图
 */

- (WHC_CLASS_VIEW *)whc_Size:(CGSize)size;

/**
 设置视图size等于view
 
 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_SizeEqualView:(WHC_VIEW *)view;

/**
 设置视图frame等于view
 @param view 相对视图
 @return 返回当前视图
 */
- (WHC_CLASS_VIEW *)whc_FrameEqualView:(WHC_VIEW *)view;

#if TARGET_OS_IPHONE || TARGET_OS_TV

#pragma mark - 自动加边线模块 -

/**
 对视图底部加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图底部加线
 
 @param value 线宽
 @param color 线的颜色
 @param pading 内边距
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading;

/**
 对视图顶部加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddTopLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图顶部加线
 
 @param value 线宽
 @param color 线的颜色
 @param pading 内边距
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddTopLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading;

/**
 对视图左边加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */


- (WHC_CLASS_VIEW *)whc_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图左边加线

 @param value   线宽
 @param color   线的颜色
 @param padding 边距
 @return 返回线视图
 */
- (WHC_CLASS_VIEW *)whc_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding;

/**
 对视图右边加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddRightLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图右边加线
 
 @param value 线宽
 @param color 线的颜色
 @param padding 边距
 @return 返回线视图
 */

- (WHC_CLASS_VIEW *)whc_AddRightLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding;
#endif
@end
