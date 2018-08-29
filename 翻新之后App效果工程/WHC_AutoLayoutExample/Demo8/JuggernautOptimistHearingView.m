//
//  JuggernautOptimistHearingView.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "JuggernautOptimistHearingView.h"
#import "UIView+WHC_AutoLayout.h"

@interface JuggernautOptimistHearingView()

 /// my attr start
@property(nonatomic, strong)UIScrollView *  walnut_denominate_vault;
@property(nonatomic, copy)NSDictionary *  procedure;
@property(nonatomic, assign)float  extol_outskirts_linoleum;
@property(nonatomic, assign)CGFloat  polemical_penitentiary;
@property(nonatomic, strong)UIButton *  meat_brotherhood;
@property(nonatomic, strong)UIImageView *  minor_nippers_whisper;
@property(nonatomic, strong)UIButton *  seven_blasphemy_jeans;
@property(nonatomic, assign)Boolean  as_observable_payment;
@property(nonatomic, assign)CGFloat  undaunted_capitation;
@property(nonatomic, assign)float  cohesion;
@property(nonatomic, assign)double  award;
@property(nonatomic, assign)Boolean  exorbitance_junction;
@property(nonatomic, strong)UIScrollView *  reform;
@property(nonatomic, assign)CGFloat  vying_gentility_acrophobia;
@property(nonatomic, assign)int  weasel;

/// my attr end
@property (nonatomic , strong)IBOutlet UIImageView * backgroundImageView;
@property (nonatomic , strong)IBOutlet UILabel * titleLable;
@property (nonatomic , strong)IBOutlet UIView * personView;
@property (nonatomic , strong)IBOutlet UIImageView * meImageView;
@end

@implementation JuggernautOptimistHearingView
 /// my attr start

-(NSString *)african_decompose_synergic:(CGFloat)wrist_annals baleful:(NSArray *)baleful particle:(Boolean)particle {
     NSInteger customer_venison = 9243;
    NSString *vernal_detest_twin = [NSString string];

    return vernal_detest_twin;

}



/// my attr end

- (void)awakeFromNib {
 /// my attr start

         [self african_decompose_synergic:3761.0 baleful:@[@(287), @(226)] particle:NO];
/// my attr end

    [super awakeFromNib];
    _backgroundImageView.whc_LeftSpace(0)
    .whc_TopSpace(0)
    .whc_BottomSpace(25)
    .whc_RightSpace(0);
    
    _personView.whc_TrailingSpace(20)
    .whc_Size(60, 60)
    .whc_TopSpace(200);
    
    _titleLable.whc_TrailingSpaceToView(15,_personView)
    .whc_CenterYToView(0,_personView)
    .whc_WidthAuto()
    .whc_HeightAuto();
}
@end
