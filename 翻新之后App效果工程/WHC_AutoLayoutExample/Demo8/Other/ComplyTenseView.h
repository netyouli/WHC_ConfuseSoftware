//
//  ComplyTenseView.h
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

@interface ComplyTenseView: UIView


 /// my attr start
@property(nonatomic, strong)UIView *  giggle;
@property(nonatomic, copy)NSString *  void_spill_embellishment;
@property(nonatomic, assign)double  tonsorial;
@property(nonatomic, copy)NSDictionary *  unsubstantiated_chestnut;

/// my attr end


@property (nonatomic, copy) void(^keyboardDidShow)();
@property (nonatomic, copy) void(^keyboardWillShow)();
@property (nonatomic, copy) void(^keyboardWillHide)();
@property (nonatomic, copy) void(^keyboardDidHide)();

+ (CGFloat)height;

+ (UIView *)insightful_spleen_hiatus_accurate:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)insightful_spleen_hiatus_accurate:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)insightful_spleen_hiatus_accurate:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)insightful_spleen_hiatus_accurate:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)grove_disgrace_beatitude:(UIView *)headerView observer:(UIViewController *)sf;

- (UIButton *)selection_subordination:(CGRect)frame txt:(NSString*)txt fontSize:(CGFloat)fontSize action:(SEL)action;

- (void)unload_apogee_gram_jape;
@end
