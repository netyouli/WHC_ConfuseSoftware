//
//  FriendsCircleCell.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "FriendsCircleCell.h"
#import "WHC_AutoLayoutExample-Swift.h"
#import "WHC_AutoLayout.h"
#import "AnswerMenuView.h"

@interface FriendsCircleCell ()<AnswerMenuViewDelegate> {

    UILabel                * _userNameLabel;
    UILabel                * _contentLabel;
    UILabel                * _supportUserLabel;
    UILabel                * _timeLabel;
    UIButton               * _answerButton;
    UIView                 * _supportView;
    
    UIImageView            * _userImageView;
    UIImageView            * _supportImageView;
    UIImageView            * _upArrowImageView;
    
    WHC_StackView          * _imageStackView;
    WHC_StackView          * _commentStackView;
    AnswerMenuView         * _menuView;
    
    FriendModel            * _model;
}

@end

@implementation FriendsCircleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initLayout];
    }
    return self;
}

- (void)createLayoutView {
    _userImageView = [UIImageView new];
    _userNameLabel = [UILabel new];
    _contentLabel = [UILabel new];
    _timeLabel = [UILabel new];
    _answerButton = [UIButton new];
    _imageStackView = [WHC_StackView new];
    _upArrowImageView = [UIImageView new];
    _commentStackView = [WHC_StackView new];
    _supportView = [UIView new];
    _supportImageView = [UIImageView new];
    _supportUserLabel = [UILabel new];
    
    [self.contentView addSubview:_userImageView];
    [self.contentView addSubview:_userNameLabel];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_answerButton];
    [self.contentView addSubview:_imageStackView];
    [self.contentView addSubview:_upArrowImageView];
    [self.contentView addSubview:_commentStackView];
    [self.contentView addSubview:_supportView];
    
    [_supportView addSubview:_supportImageView];
    [_supportView addSubview:_supportUserLabel];
    
    [_supportImageView whc_LeftSpace:5];
    [_supportImageView whc_CenterY:0];
    [_supportImageView whc_Size:CGSizeMake(15, 15)];
    
    [_supportUserLabel whc_LeftSpace:5 toView:_supportImageView];
    [_supportUserLabel whc_TopSpace:0];
    [_supportUserLabel whc_RightSpace:0];
    [_supportUserLabel whc_BottomSpace:0];
    
    [_supportView whc_AddBottomLine:1 lineColor:[UIColor colorWithWhite:0.8 alpha:1]];
    
    [_answerButton addTarget:self action:@selector(clickAnswerButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor grayColor];
    _userNameLabel.textColor = [UIColor colorWithRed:37.0 / 255 green:75.0 / 255 blue:131.0 / 255 alpha:1];
    _supportImageView.image = [UIImage imageNamed:@"like"];
    [_answerButton setBackgroundImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
    _upArrowImageView.image = [UIImage imageNamed:@"LikeCmtBg"];
    _commentStackView.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1.0];
    _supportView.backgroundColor = _commentStackView.backgroundColor;
    _timeLabel.text = @"1小时前";
    _supportUserLabel.backgroundColor = _commentStackView.backgroundColor;
    _supportUserLabel.text = @"吴海超(WHC)";
    _supportUserLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.backgroundColor = [UIColor whiteColor];
}

- (void)initLayout {
    [self createLayoutView];
    
    /// 使用先进的WHC_AutoLayoutKit进行自动布局
    [_userImageView whc_Frame:10 top:15 width:40 height:40];
    _userNameLabel.whc_TopSpaceEqualView(_userImageView)
                  .whc_LeftSpaceToView(10,_userImageView)
                  .whc_WidthAuto()
                  .whc_Height(20);
    
    _contentLabel.whc_LeftSpaceEqualView(_userNameLabel)
                 .whc_TopSpaceToView(5,_userNameLabel)
                 .whc_RightSpace(10)
                 .whc_HeightAuto();
    
    _imageStackView.whc_TopSpaceToView(5,_contentLabel)
                   .whc_LeftSpaceEqualView(_contentLabel)
                   .whc_RightSpace(10)
                   .whc_HeightAuto();
    
    /// 配置图片展示容器
    _imageStackView.whc_Column = 3;               // 最大3列
    _imageStackView.whc_Edge = UIEdgeInsetsZero;  // 内边距为0
    _imageStackView.whc_HSpace = 4;                // 图片之间的空隙为4
    _imageStackView.whc_VSpace = 4;                // 图片之间的空隙为4
    _imageStackView.whc_Orientation = All;        // 横竖混合布局
    _imageStackView.whc_ElementHeightWidthRatio = 4 / 3; // 图片高宽比
    
    _timeLabel.whc_TopSpaceToView(10,_imageStackView)
              .whc_LeftSpaceEqualView(_imageStackView)
              .whc_Size(100, 20);
    
    _answerButton.whc_TopSpaceEqualView(_timeLabel)
                 .whc_TrailingSpace(10)
                 .whc_Size(30, 25);
    
    _upArrowImageView.whc_TopSpaceToView(5,_timeLabel)
                     .whc_LeftSpaceEqualView(_timeLabel)
                     .whc_Size(60, 20);
    
    _supportView.whc_TopSpaceToView(10,_timeLabel)
                .whc_LeftSpaceEqualView(_timeLabel)
                .whc_RightSpace(10)
                .whc_Height(21);
    
    _commentStackView.whc_TopSpaceToView(0,_supportView)
                     .whc_LeftSpaceEqualView(_timeLabel)
                     .whc_RightSpace(10)
                     .whc_HeightAuto();
    
    /// 配置评论展示容器
    _commentStackView.whc_Edge = UIEdgeInsetsMake(5, 5, 5, 5);  // 内边距为5
    _commentStackView.whc_HSpace = 10;                           // 评论之间的空隙为10
    _commentStackView.whc_VSpace = 10;                           // 评论之间的空隙为10
    _commentStackView.whc_Orientation = Vertical;               // 垂直布局
    
    /// 设置cell底部间隙
    self.whc_CellBottomView = _commentStackView;
    self.whc_CellBottomOffset = 10;
    self.whc_TableViewWidth = self.whc_sw;
    [self whc_AddBottomLine:1 lineColor:[UIColor colorWithWhite:0.8 alpha:1]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setComment:(UILabel *)label answer:(Answer *)answer userName:(NSString *)userName {
    NSString * text = nil;
    if (answer.isReply) {
        text = [NSString stringWithFormat:@"%@回复%@: %@",answer.name,userName,answer.content];
    }else {
        text = [NSString stringWithFormat:@"%@: %@",answer.name,answer.content];
    }
    label.text = text;
    NSMutableAttributedString * textAttr = [[NSMutableAttributedString alloc] initWithString:text];
    if (answer.isReply) {
        [textAttr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:answer.name]];
        [textAttr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:userName]];
    }else {
        [textAttr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:answer.name]];
    }
    label.attributedText = textAttr;
}

/// 评论StackView和图片StackView视图复用处理
- (void)resetstackViewWithIsComment:(BOOL)isComment model:(FriendModel *)friendModel {
    if (!isComment) {
        [_imageStackView whc_RemoveAllSubviews];
    }else {
        [_commentStackView whc_RemoveAllSubviews];
    }
    NSInteger newCount = isComment ? friendModel.answerArray.count : friendModel.imageArray.count;
    NSInteger oldCount = isComment ? _commentStackView.subviews.count : _imageStackView.subviews.count;
    NSInteger countDiff = newCount - oldCount;
    
    /*
    if (countDiff < 0) {// 删除多余的
        NSArray * subViewArray = isComment ? _commentStackView.subviews : _imageStackView.subviews;
        NSArray * removeCommentViewArray = [subViewArray subarrayWithRange:NSMakeRange(newCount, -countDiff)];
        for (UIView * view in removeCommentViewArray) {
            [view removeFromSuperview];
        }
        oldCount = isComment ? _commentStackView.whc_SubViewCount : _imageStackView.whc_SubViewCount;
    }
    countDiff = MAX(0, countDiff);
    for (int i = 0; i < oldCount; i++) {
        if (isComment) {
            Answer * answer = friendModel.answerArray[i];
            UILabel * commentLabel = _commentStackView.subviews[i];
            [self setComment:commentLabel answer:answer userName:friendModel.userName];
        }else {
            UIImageView * imageView = _imageStackView.subviews[i];
            if (_model.imageArray.count > i &&
                [_model.imageArray[i] isEqualToString:friendModel.imageArray[i]]){}else {
                imageView.image = [UIImage imageNamed:friendModel.imageArray[i]];
            }
        }
    }*/
    for(int i = 0; i < countDiff; i++) {
        if (isComment) {
            UILabel * commentLabel = commentLabel = [UILabel new];
            commentLabel.backgroundColor = _commentStackView.backgroundColor;
            commentLabel.numberOfLines = 0;
            commentLabel.font = [UIFont systemFontOfSize:14];
            Answer * answer = friendModel.answerArray[oldCount + i];
            [self setComment:commentLabel answer:answer userName:friendModel.userName];
            [_commentStackView addSubview:commentLabel];
        }else {
            UIImageView * imageView = imageView = [UIImageView new];
            imageView.userInteractionEnabled = YES;
            imageView.tag = oldCount + i;
            UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageGesture:)];
            [imageView addGestureRecognizer:tapGesture];
            imageView.image = [UIImage imageNamed:friendModel.imageArray[i + oldCount]];
            [_imageStackView addSubview:imageView];
        }
    }
    isComment ? [_commentStackView whc_StartLayout] : [_imageStackView whc_StartLayout];
}

- (void)setFriendModel:(FriendModel *)friendModel {
    if (!_model) {
        if (![_model.userImage isEqualToString:friendModel.userImage]) {
            _userImageView.image = [UIImage imageNamed:friendModel.userImage];
        }
    }
    _userNameLabel.text = friendModel.userName;
    _contentLabel.text = friendModel.content;
    if (friendModel.isSupper) {
        _supportView.hidden = YES;
        [_commentStackView whc_TopSpace:10 toView:_timeLabel];
    }else {
        _supportView.hidden = NO;
        [_commentStackView whc_TopSpace:0 toView:_supportView];
    }
    if (friendModel.imageArray.count == 1) {
        _imageStackView.whc_Column = 2;
    }else {
        _imageStackView.whc_Column = 3;
    }
    [self resetstackViewWithIsComment:NO model:friendModel];
    [self resetstackViewWithIsComment:YES model:friendModel];
    if (friendModel.answerArray.count == 0) {
        _upArrowImageView.hidden = YES;
    }else {
        _upArrowImageView.hidden = NO;
    }
    _model = nil;
    _model = friendModel;
}

#pragma mark - buttonAction -

- (void)tapImageGesture:(UITapGestureRecognizer *)tapGesture {
    NSInteger column = 3;
    if (_model.imageArray.count == 1) {
        column = 2;
    }
    [WHC_ImageDisplayView show:_model.imageArray index:tapGesture.view.tag item:tapGesture.view column:column];
}

- (void)clickAnswerButton:(UIButton *)sender {
    if (!_menuView) {
        _menuView = [AnswerMenuView new];
        _menuView.delegate = self;
    }
    [_menuView whc_Width:0];
    [self.contentView addSubview:_menuView];
    [_menuView whc_TrailingSpace:2 toView:_answerButton];
    [_menuView whc_CenterY:0 toView:_answerButton];
    [_menuView whc_Size:CGSizeMake(150, 40)];
    [_menuView layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [_menuView layoutIfNeeded];
        [_menuView whc_StartLayout];
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - AnswerMenuViewDelegate -

- (void)answerMenuView:(AnswerMenuView *)menuView isClickSupper:(BOOL)isSupper {
    menuView.whc_ResetConstraint();
    [menuView removeFromSuperview];
    if (isSupper) {
        _model.isSupper = !_model.isSupper;
        if (_delegate && [_delegate respondsToSelector:@selector(friendsCircleSupperCell:)]) {
            [_delegate friendsCircleSupperCell:self];
        }
    }else {
        if (_delegate && [_delegate respondsToSelector:@selector(friendsCircleCell:clickRow:lastCommentLabel:)]) {
            UIView * answerLabel = [_commentStackView.subviews lastObject];
            if (_commentStackView.subviews.count == 0) {
                answerLabel = _commentStackView;
            }
            [_delegate friendsCircleCell:self clickRow:_row lastCommentLabel:answerLabel];
        }
    }
}

@end
