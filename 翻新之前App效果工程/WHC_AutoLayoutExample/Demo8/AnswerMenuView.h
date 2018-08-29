//
//  AnswerMenuView.h
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2018/8/27.
//  Copyright © 2018年 吴海超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHC_AutoLayout.h"

@class AnswerMenuView;

@protocol AnswerMenuViewDelegate <NSObject>
- (void)answerMenuView:(AnswerMenuView *)menuView isClickSupper:(BOOL)isSupper;

@end

@interface AnswerMenuView : WHC_StackView
@property (nonatomic, strong) UIButton * supperButton;
@property (nonatomic, strong) UIButton * answerButton;
@property (nonatomic, weak) id<AnswerMenuViewDelegate> delegate;

- (void)clickSupperButton:(UIButton *)sender;
- (void)clickAnswerButton:(UIButton *)sender;
@end
