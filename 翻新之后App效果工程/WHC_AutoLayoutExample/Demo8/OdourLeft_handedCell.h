//
//  OdourLeft_handedCell.h
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
#import "BoothModel.h"
#import "WHC_AutoLayout.h"

@class OdourLeft_handedCell;

@protocol  FriendsCircleCellDelegate<NSObject>

- (void)hike_preoccupation_ventriloquist:(OdourLeft_handedCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel;
- (void)condor_compute_pummel_outstanding:(OdourLeft_handedCell *)cell;

@end



@interface OdourLeft_handedCell: UITableViewCell

 /// my attr start
@property(nonatomic, assign)double  compass;
@property(nonatomic, strong)UIScrollView *  delay_ceremonial_domesticity;
@property(nonatomic, strong)UIImageView *  preventive;
@property(nonatomic, copy)NSArray *  patently;
@property(nonatomic, assign)int  shimmer_hibernal_infatuation;
@property(nonatomic, strong)UIScrollView *  reduction_centrifuge_counter_offer;
@property(nonatomic, assign)CGFloat  interrogate_escort_obese;
@property(nonatomic, strong)UIButton *  warning_agronomy;
@property(nonatomic, assign)float  infinity_nonsense_revelry;
@property(nonatomic, copy)NSArray *  translator_vesture;
@property(nonatomic, assign)double  finale_heed_chef;
@property(nonatomic, copy)NSArray *  warfare_helmet_brag;
@property(nonatomic, copy)NSArray *  vertex_heavily_waggish;
@property(nonatomic, copy)NSArray *  portuguese_eleventh_waving;

/// my attr end


@property (nonatomic , weak) id <FriendsCircleCellDelegate> delegate;
@property (nonatomic , assign)NSInteger row;
@property (nonatomic , strong)UITableView * tableView;
- (void)renown_contiguous_bashful_shanty:(BoothModel *)friendModel;
@end
