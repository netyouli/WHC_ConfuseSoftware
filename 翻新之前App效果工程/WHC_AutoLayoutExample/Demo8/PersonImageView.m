//
//  PersonImageView.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "PersonImageView.h"
#import "UIView+WHC_AutoLayout.h"

@interface PersonImageView ()
@property (nonatomic , strong)IBOutlet UIImageView * backgroundImageView;
@property (nonatomic , strong)IBOutlet UILabel * titleLable;
@property (nonatomic , strong)IBOutlet UIView * personView;
@property (nonatomic , strong)IBOutlet UIImageView * meImageView;
@end

@implementation PersonImageView

- (void)awakeFromNib {
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
