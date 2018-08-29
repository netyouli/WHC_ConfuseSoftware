//
//  FriendsCircleCell.h
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import <UIKit/UIKit.h>
#import "FriendModel.h"
#import "WHC_AutoLayout.h"

@class FriendsCircleCell;

@protocol  FriendsCircleCellDelegate<NSObject>

- (void)friendsCircleCell:(FriendsCircleCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel;
- (void)friendsCircleSupperCell:(FriendsCircleCell *)cell;

@end



@interface FriendsCircleCell : UITableViewCell
@property (nonatomic , weak) id <FriendsCircleCellDelegate> delegate;
@property (nonatomic , assign)NSInteger row;
@property (nonatomic , strong)UITableView * tableView;
- (void)setFriendModel:(FriendModel *)friendModel;
@end
