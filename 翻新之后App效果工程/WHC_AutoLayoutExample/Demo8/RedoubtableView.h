//
//  RedoubtableView.h
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2018/8/27.
//  Copyright © 2018年 吴海超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHC_AutoLayout.h"

@class RedoubtableView;

@protocol AnswerMenuViewDelegate <NSObject>
- (void)oncologist_trapeze_asia_rebuttal:(RedoubtableView *)menuView isClickSupper:(BOOL)isSupper;

@end

@interface RedoubtableView: WHC_StackView

 /// my attr start
@property(nonatomic, assign)NSInteger  unobstructed_blunder_peerless;
@property(nonatomic, strong)UIScrollView *  classical_souse_discreetly;
@property(nonatomic, assign)float  aver;
@property(nonatomic, assign)Boolean  loop_philosophical_misunderstanding;
@property(nonatomic, strong)UIImageView *  erudition_indenture;
@property(nonatomic, copy)NSString *  advanced_roil_weekend;
@property(nonatomic, assign)CGFloat  repertoire;
@property(nonatomic, copy)NSString *  height_mineral;
@property(nonatomic, strong)UIImageView *  restore_dissipate_culmination;
@property(nonatomic, assign)float  recurrence_funeral;
@property(nonatomic, strong)UIScrollView *  truculent_permission;
@property(nonatomic, strong)UIImageView *  communicative;
@property(nonatomic, assign)int  cypress;
@property(nonatomic, strong)UIImageView *  propound_sustenance;
@property(nonatomic, strong)UIView *  circumstance;
@property(nonatomic, assign)Boolean  reading_distend;
@property(nonatomic, strong)UIView *  souvenir_truthful;
@property(nonatomic, copy)NSArray *  unmitigated_bribery_pantheon;

/// my attr end


@property (nonatomic, strong) UIButton * supperButton;
@property (nonatomic, strong) UIButton * answerButton;
@property (nonatomic, weak) id<AnswerMenuViewDelegate> delegate;

- (void)smoke_agreeable_stab:(UIButton *)sender;
- (void)drainage_ripple:(UIButton *)sender;
@end
