//
//  AnswerMenuView.m
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2018/8/27.
//  Copyright © 2018年 吴海超. All rights reserved.
//

#import "AnswerMenuView.h"


@implementation AnswerMenuView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.whc_Edge = UIEdgeInsetsZero;
        self.whc_Orientation = Horizontal;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
        _supperButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _answerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_supperButton setTitle:@"赞" forState:UIControlStateNormal];
        [_supperButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _supperButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_answerButton setTitle:@"评论" forState:UIControlStateNormal];
        [_answerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _answerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_supperButton];
        [self addSubview:_answerButton];
        [self whc_StartLayout];
        [_supperButton addTarget:self action:@selector(clickSupperButton:) forControlEvents:UIControlEventTouchUpInside];
        [_answerButton addTarget:self action:@selector(clickAnswerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)clickSupperButton:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        _supperButton.transform = CGAffineTransformMakeScale(2, 2);
    } completion:^(BOOL finished) {
        _supperButton.transform = CGAffineTransformIdentity;
        if (_delegate && [_delegate respondsToSelector:@selector(answerMenuView:isClickSupper:)]) {
            [_delegate answerMenuView:self isClickSupper:YES];
        }
    }];
}

- (void)clickAnswerButton:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(answerMenuView:isClickSupper:)]) {
        [_delegate answerMenuView:self isClickSupper:NO];
    }
}

@end

