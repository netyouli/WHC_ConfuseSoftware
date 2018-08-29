//
//  DemoVC4.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "DemoVC4.h"
#import "WHC_AutoLayout.h"

@interface DemoVC4 (){
    WHC_StackView * stackView1, *stackView2;
}

@end

@implementation DemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"StackView 垂直自动布局";
    // 创建容器视图12
    stackView1 = [WHC_StackView new];
    stackView2 = [WHC_StackView new];
    
    stackView1.backgroundColor = [UIColor orangeColor];
    stackView2.backgroundColor = [UIColor magentaColor];
    
    [self.view addSubview:stackView2];
    [self.view addSubview:stackView1];
    
    // 容器视图1布局
    [stackView1 whc_AutoWidth:0 top:64 right:0 height:150];
    [stackView1 whc_HeightEqualView:stackView2];
    
    // 容器视图1配置
    stackView1.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    stackView1.whc_Orientation = Vertical;// 自动垂直布局
    stackView1.whc_HSpace = 10;
    stackView1.whc_VSpace = 10;
    
    UILabel * lable1 = [UILabel new];
    UILabel * lable2 = [UILabel new];
    UILabel * lable3 = [UILabel new];
    UILabel * lable4 = [UILabel new];
    
    lable1.backgroundColor = [UIColor grayColor];
    lable2.backgroundColor = [UIColor magentaColor];
    lable3.backgroundColor = [UIColor redColor];
    lable4.backgroundColor = [UIColor yellowColor];
    
    // 添加到容器视图
    [stackView1 addSubview:lable1];
    [stackView1 addSubview:lable2];
    [stackView1 addSubview:lable3];
    [stackView1 addSubview:lable4];
    
    // 容器视图2布局 一行代码添加约束
    stackView2.whc_LeftSpace(0)
        .whc_TopSpaceToView(10,stackView1)
        .whc_RightSpace(0)
        .whc_BottomSpace(10);
        
    // 容器视图2配置
    stackView2.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    stackView2.whc_Orientation = Vertical;// 自动垂直布局;
    stackView2.whc_HSpace = 10;
    stackView2.whc_VSpace = 10;
    
    // 创建容器视图2的子容器视图（容器嵌套使用）
    WHC_StackView * substackView21 = [WHC_StackView new];
    WHC_StackView * substackView22 = [WHC_StackView new];
    
    substackView21.backgroundColor = [UIColor orangeColor];
    substackView22.backgroundColor = [UIColor orangeColor];
    
    // 添加容器2视图子容器
    [stackView2 addSubview:substackView21];
    [stackView2 addSubview:substackView22];
    
    // 容器2视图子容器21配置
    substackView21.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    substackView21.whc_Orientation = Vertical;// 自动垂直布局;
    substackView21.whc_HSpace = 10;
    substackView21.whc_VSpace = 10;
    
    UIView * sublable211 = [UIView new];
    UIView * sublable212 = [UIView new];
    UIView * sublable213 = [UIView new];
    UIView * sublable214 = [UIView new];
    
    sublable211.backgroundColor = [UIColor grayColor];
    sublable212.backgroundColor = [UIColor grayColor];
    sublable213.backgroundColor = [UIColor grayColor];
    sublable214.backgroundColor = [UIColor grayColor];
    
    // 子元素高度占比权重
    sublable211.whc_HeightWeight = 2;
    sublable212.whc_HeightWeight = 3;
    
    // 添加子元素到容器视图
    [substackView21 addSubview:sublable211];
    [substackView21 addSubview:sublable212];
    [substackView21 addSubview:sublable213];
    [substackView21 addSubview:sublable214];
    
    // 容器2视图子容器22配置
    substackView22.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    substackView22.whc_Orientation = Vertical;// 自动垂直布局;
    substackView22.whc_HSpace = 10;
    substackView22.whc_VSpace = 10;
    
    UIView * sublable221 = [UIView new];
    UIView * sublable222 = [UIView new];
    UIView * sublable223 = [UIView new];
    UIView * sublable224 = [UIView new];
    
    sublable221.backgroundColor = [UIColor grayColor];
    sublable222.backgroundColor = [UIColor grayColor];
    sublable223.backgroundColor = [UIColor grayColor];
    sublable224.backgroundColor = [UIColor grayColor];
    
    [substackView22 addSubview:sublable221];
    [substackView22 addSubview:sublable222];
    [substackView22 addSubview:sublable223];
    [substackView22 addSubview:sublable224];
    
    // 开始对容器进行自动布局
    [stackView1 whc_StartLayout];
    [stackView2 whc_StartLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
