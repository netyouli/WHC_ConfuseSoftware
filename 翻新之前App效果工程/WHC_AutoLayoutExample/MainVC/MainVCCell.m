//
//  MainVCCell.m
//  WHC_AutoAdpaterViewDemo
//
//  Created by 吴海超 on 16/2/22.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "MainVCCell.h"
#import "WHC_AutoLayout.h"

@interface MainVCCell () {
    UILabel * _title , * _content;
}

@end

@implementation MainVCCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _title = [UILabel new];
        _content = [UILabel new];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_content];
        _title.textColor = [UIColor redColor];
        _title.font = [UIFont boldSystemFontOfSize:20];
        [_title whc_AutoWidth:10 top:10 right:10 height:30];
        [_content whc_LeftSpace:10];
        [_content whc_TopSpace:10 toView:_title];
        [_content whc_RightSpace:10];
        [_content whc_AutoHeight];
        self.whc_CellBottomOffset = 10;
        self.whc_CellBottomView = _content;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContent:(NSString *)content title:(NSString *)title {
    _title.text = title;
    _content.text = content;
}

@end
