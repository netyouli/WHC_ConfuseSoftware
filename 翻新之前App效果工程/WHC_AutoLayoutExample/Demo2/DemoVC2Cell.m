//
//  DemoVC2Cell.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "DemoVC2Cell.h"
#import "WHC_AutoLayout.h"

#define cellName (@"CellName")
@interface DemoVC2Cell () {
    UILabel *  _image;
    UILabel *  _title;
    UILabel *  _content;
    UILabel *  _other;
    WHC_StackView * _stackView;
}

@end

@implementation DemoVC2Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
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

- (void)setContent:(NSString *)content index:(NSInteger)index {
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
