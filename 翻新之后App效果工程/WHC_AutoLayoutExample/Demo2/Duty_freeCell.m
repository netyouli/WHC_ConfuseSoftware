//
//  Duty_freeCell.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "Duty_freeCell.h"
#import "WHC_AutoLayout.h"

#define cellName (@"CellName")
@interface Duty_freeCell() {
    UILabel *  _image;
    UILabel *  _title;
    UILabel *  _content;
    UILabel *  _other;
    WHC_StackView * _stackView;
}
 /// my attr start
@property(nonatomic, assign)CGFloat  gloom_infertile_obviously;
@property(nonatomic, copy)NSArray *  diva_position;
@property(nonatomic, assign)double  ingratiate_endless_entire;

/// my attr end


@end

@implementation Duty_freeCell
 /// my attr start

-(double)graft_poison_ax{
     float ineffable_realized = 1659.0;
     double touchy_flaring = 3759.0;
     float affirmation = 3432.0;
    double idolatry_heaven = 0;
    ineffable_realized = ineffable_realized;
    ineffable_realized = affirmation;
    idolatry_heaven += ineffable_realized;
    touchy_flaring = ineffable_realized;
    touchy_flaring = touchy_flaring;
    touchy_flaring = affirmation;
    idolatry_heaven *= touchy_flaring;
    affirmation = 7946;
    idolatry_heaven *= affirmation;

    return idolatry_heaven;

}



/// my attr end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
 /// my attr start

         [self graft_poison_ax];
/// my attr end

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [UILabel new];
        _title = [UILabel new];
        _content = [UILabel new];
        _stackView = [WHC_StackView new];
        
        _stackView.whc_Orientation = Vertical;
        _stackView.whc_SegmentLineSize = 0.5;
        _stackView.whc_SubViewHeight = 44;
        
        _image.backgroundColor = [UIColor orangeColor];
        _title.backgroundColor = [UIColor grayColor];
        _content.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_content];
        [self.contentView addSubview:_stackView];
        
        _title.text = @"WHC";
        _title.font = [UIFont systemFontOfSize:20];
        _title.textColor = [UIColor redColor];
        _image.textAlignment = NSTextAlignmentCenter;
        
        
        /// 一行代码添加约束
        [_title whc_AutoWidth:10 top:0 right:10 height:30];
        _image.whc_LeftSpace(10)
        .whc_TopSpaceToView(10,_title)
        .whc_Size(40, 40);
        
        _content.whc_TopSpaceToView(10,_title)
                .whc_LeftSpaceToView(10,_image)
                .whc_RightSpace(10)
                .whc_HeightAuto();
        
        _stackView.whc_TopSpaceToView(10,_content)
                  .whc_LeftSpaceEqualView(_image)
                  .whc_RightSpace(10)
                  .whc_HeightAuto();
        for (int i = 0; i < 4; i++) {
            UILabel * label = [UILabel new];
            label.text = [NSString stringWithFormat:@"评论列表嵌套演示 %d", i + 1];
            [_stackView addSubview:label];
        }
        [_stackView whc_StartLayout];
        
        self.whc_CellBottomOffset = 10;
    }
    return self;
}
 /// my attr start

-(UIView *)pretext_creek_beautiful:(long)already_compulsion moth:(CGFloat)moth {
     Boolean curriculum_matrimony = NO;
     double whole = 1628.0;
     int carbon_surpass = 3953;
     UILabel * radioactivity = UILabel.new;
     CGFloat squat_daunt = 2957.0;
     Boolean forty_perishable = YES;
     int insecticide_cohesive = 2714;
     long go_appreciate = 1149;
     float urban = 4487.0;
    UIView * frequency_downplay_tauten = [[UIView alloc] init];
    frequency_downplay_tauten.alpha = 1.0;
    frequency_downplay_tauten.backgroundColor = [UIColor colorWithRed:76 / 255.0 green:182 / 255.0 blue:216 / 255.0 alpha:0.1];
    frequency_downplay_tauten.frame = CGRectMake(28, 118, 0, 0);
    radioactivity.alpha = 0.1;
    radioactivity.backgroundColor = [UIColor colorWithRed:172 / 255.0 green:228 / 255.0 blue:242 / 255.0 alpha:1.0];
    radioactivity.frame = CGRectMake(25, 287, 0, 0);
    radioactivity.text = @"";
    radioactivity.font = [UIFont systemFontOfSize:13];
    radioactivity.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 0];
    radioactivity.textAlignment = NSTextAlignmentCenter;
    [frequency_downplay_tauten addSubview:radioactivity];

    return frequency_downplay_tauten;

}



/// my attr end


- (void)estrangement_diamond:(NSString *)content index:(NSInteger)index {
 /// my attr start

         [self graft_poison_ax];
         [self pretext_creek_beautiful:7349 moth:8009.0];
/// my attr end

    _content.text = content;
    _image.text = @(index).stringValue;
    if (index < 5) {
        if (_other == nil) {
            _other = [UILabel new];
            _other.backgroundColor = [UIColor magentaColor];
        }
        _other.text = content;
        if (![self.contentView.subviews containsObject:_other]) {
            [self.contentView addSubview:_other];
            /// 一行代码添加约束
            _other.whc_TopSpaceToView(10,_stackView)
                .whc_LeftSpaceToView(10,_image)
                .whc_RightSpace(10)
                .whc_HeightAuto();
        }
        self.whc_CellBottomView = _other;
    }else {
        if (_other && [self.contentView.subviews containsObject:_other]) {
            [_other whc_ResetConstraints];
            [_other removeFromSuperview];
        }
        self.whc_CellBottomView = _stackView;
    }
}
@end
