//
//  WHC_KeyboradHeaderView.h
//  CTBMobileBank
//
//  Created by 吴海超 on 15/5/27.
//
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/
#import <UIKit/UIKit.h>

@interface WHC_KeyboradHeaderView : UIView

@property (nonatomic, copy) void(^keyboardDidShow)();
@property (nonatomic, copy) void(^keyboardWillShow)();
@property (nonatomic, copy) void(^keyboardWillHide)();
@property (nonatomic, copy) void(^keyboardDidHide)();

+ (CGFloat)height;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)monitorKeyboradShowAddHeaderView:(UIView *)headerView observer:(UIViewController *)sf;

- (UIButton *)createButton:(CGRect)frame txt:(NSString*)txt fontSize:(CGFloat)fontSize action:(SEL)action;

- (void)removeObserver;
@end
