//
//  FooterView.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/15.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "FooterView.h"

@interface FooterView ()
@property (nonatomic ,strong) IBOutlet UIActivityIndicatorView * indicatorView;
@end

@implementation FooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    [_indicatorView startAnimating];
}

@end
