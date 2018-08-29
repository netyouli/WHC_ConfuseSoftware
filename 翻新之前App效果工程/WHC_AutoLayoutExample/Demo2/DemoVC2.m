//
//  DemoVC2.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//


/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "DemoVC2.h"
#import "DemoVC2Cell.h"
#import "WHC_AutoLayout.h"

@interface DemoVC2 ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView * _tableView;
    NSArray * dateSourceArray;
    UIView  * view1;
}

@end

@implementation DemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"列表自动计算cell高度";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(clickRefresh:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    dateSourceArray = @[@"自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell",
                        @"自动计算cell高度，加载cell\
                        自动计算cell高度，加载cell"];
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    /// 一行代码添加约束 (全屏)
    [_tableView whc_AutoSize:0 top:0 right:0 bottom:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[DemoVC2Cell class] forCellReuseIdentifier:NSStringFromClass([DemoVC2Cell class])];
    [_tableView reloadData];
}

- (void)clickRefresh:(UIBarButtonItem *)sender {
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_tableView reloadData];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoVC2Cell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DemoVC2Cell class])];
    cell.backgroundColor = [UIColor whiteColor];
    NSString * content = [dateSourceArray objectAtIndex:indexPath.row];
    [cell setContent:content index:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dateSourceArray.count;
}

/// 自动计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DemoVC2Cell whc_CellHeightForIndexPath:indexPath tableView:tableView];
}
@end
