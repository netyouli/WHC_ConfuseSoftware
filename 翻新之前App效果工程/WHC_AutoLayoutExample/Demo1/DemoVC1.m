//
//  DemoVC1.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "DemoVC1.h"
#import "WHC_AutoLayout.h"

@interface DemoVC1 () {
    UIView  * view1, * view2, * view3;
    UILabel * lable;
    UILabel * lable1,*lable2,*lable3;
    CGFloat width , height;
    
    UILabel * txt;
}

@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;

@end

@implementation DemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"普通高度宽度自动布局";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    view1 = [UIView new];
    view2 = [UIView new];
    view3 = [UIView new];
    lable = [UILabel new];
    txt = [UILabel new];
    
    [self.view addSubview:txt];
    txt.backgroundColor = [UIColor grayColor];
    
    view1.backgroundColor = [UIColor orangeColor];
    view2.backgroundColor = [UIColor grayColor];
    view3.backgroundColor = [UIColor redColor];
    lable.backgroundColor = [UIColor magentaColor];
    lable.text = @"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    
    UIButton * btn = [UIButton new];
    [btn setTitle:@"收起" forState:UIControlStateNormal];
    [btn setTitle:@"展开" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [view2 addSubview:lable];
    
    btn.whc_IsSafe(YES)
        .whc_TopSpaceToView(5,view2)
        .whc_LeftSpaceEqualView(view2)
        .whc_RightSpaceEqualView(view2)
        .whc_Height(40);
    
    /// 一行代码添加约束
    view1.whc_LeftSpace(10)
         .whc_TopSpace(74)
         .whc_WidthEqualView(view2)
         .whc_Height(150);

    view2.whc_LeftSpaceToView(10,view1)
         .whc_TopSpaceEqualView(view1)
         .whc_RightSpace(10)
         .whc_HeightAuto();
    
    
    
    [_l2 whc_ClearLayoutAttrs];
    
    txt.whc_LeftSpace(10)
    .whc_TopSpaceToView(10, view1)
    .whc_Height(40)
    .whc_Width(200)
    .whc_LessOrEqual()
    .whc_Width(10)
    .whc_GreaterOrEqual();
    
    /// 宽度小于等于200并且大于等于10 约束演示
    txt.text = @"whc_LessOrEqual";
 
}


- (void)clickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        /// 高度约束20并且不删除bottom约束
        lable.whc_Height(20);
    }else {
        /// 自动高度约束并且不删除bottom约束
        lable.whc_HeightAuto();
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    /// 一行代码添加约束
    lable.whc_LeftSpace(10)
        .whc_RightSpace(10)
        .whc_TopSpace(10)
        .whc_HeightAuto()
        .whc_BottomSpace(10);

    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
