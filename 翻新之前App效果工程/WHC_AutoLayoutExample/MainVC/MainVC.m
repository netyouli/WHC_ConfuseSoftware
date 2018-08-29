//
//  MainVC.m
//  WHC_AutoAdpaterViewDemo
//
//  Created by 吴海超 on 16/2/22.
//  Copyright © 2016年 吴海超. All rights reserved.
//

#import "MainVC.h"
#import "MainVCCell.h"
#import "WHC_AutoLayout.h"
#import "DemoVC1.h"
#import "DemoVC2.h"
#import "DemoVC3.h"
#import "DemoVC4.h"
#import "DemoVC5.h"
#import "DemoVC6.h"
#import "DemoVC7.h"
#import "WeiXinFriendsCircleVC.h"

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

@interface MainVC () {
    NSArray * _contents;
    BOOL      _initPush;
}

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"自动布局库";
    _contents = @[@"UILayoutGuide, safeAreaLayoutGuide演示",
                  @"宽度高度自动拉伸布局\n宽度高度自动拉伸布局\n宽度高度自动拉伸布局",
                  @"列表自动布局自动计算cell高度布局\n列表自动布局自动计算cell高度布局\n列表自动布局自动计算cell高度布局\n列表自动布局自动计算cell高度布局\n列表自动布局自动计算cell高度布局\n列表自动布局自动计算cell高度布局",
                  @"stackView 自动横向布局和横向嵌套布局\nstackView 自动横向布局和横向嵌套布局\nstackView 自动横向布局和横向嵌套布局\nstackView 自动横向布局和横向嵌套布局",
                  @"stackView 自动垂直布局和垂直嵌套布局\nstackView 自动垂直布局和垂直嵌套布局\nstackView 自动垂直布局和垂直嵌套布局\nstackView 自动垂直布局和垂直嵌套布局",
                  @"stackView 自动垂直横向混合布局和垂直横向混合嵌套布局\nstackView 自动垂直横向混合布局和垂直横向混合嵌套布局\nstackView 自动垂直横向混合布局和垂直横向混合嵌套布局\nstackView 自动垂直横向混合布局和垂直横向混合嵌套布局",
                  @"WHC_StackView支持分割线设置",
                  @"微信朋友圈演示",
                  @"Mp3播放列表"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[MainVCCell class] forCellReuseIdentifier:NSStringFromClass([MainVCCell class])];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!_initPush) {
        _initPush = YES;
        WeiXinFriendsCircleVC * vc = [WeiXinFriendsCircleVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.tableView reloadData];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainVCCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainVCCell class])];
    cell.backgroundColor = [UIColor whiteColor];
    NSString * content = [_contents objectAtIndex:indexPath.row];
    NSString * title = [NSString stringWithFormat:@"Demo%ld",(long)indexPath.row + 1];
    [cell setContent:content title:title];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contents.count;
}

/// 一行代码计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [MainVCCell whc_CellHeightForIndexPath:indexPath tableView:tableView];
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0: {
            DemoVC7 * vc = [DemoVC7 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1: {
            DemoVC1 * vc = [DemoVC1 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: {
            DemoVC2 * vc = [DemoVC2 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3: {
            DemoVC3 * vc = [DemoVC3 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4: {
            DemoVC4 * vc = [DemoVC4 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5: {
            DemoVC5 * vc = [DemoVC5 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6: {
            DemoVC6 * vc = [DemoVC6 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7: {
            WeiXinFriendsCircleVC * vc = [WeiXinFriendsCircleVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8: {
//            Mp3ListVC * vc = [Mp3ListVC new];
//            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
