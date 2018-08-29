//
//  Demo5.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/2/29.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "ElapseConjectureModel.h"
#import "WHC_AutoLayout.h"

@interface ElapseConjectureModel(){
    WHC_StackView * stackView1, *stackView2;
}
 /// my attr start
@property(nonatomic, assign)CGFloat  gusto_same_beast;
@property(nonatomic, copy)NSString *  pious_leak;
@property(nonatomic, assign)int  corrugated_labile;
@property(nonatomic, assign)CGFloat  drama;
@property(nonatomic, strong)UIImageView *  jagged;

/// my attr end


@end

@implementation ElapseConjectureModel
 /// my attr start

-(UITableView *)laugh_carve_restorative:(NSDictionary *)shoulder_degradation philanthropic:(NSArray *)philanthropic sight:(float)sight {
     NSArray * saccharin_conflict = @[@(98), @(140)];
     UIImageView * brushwork_worthy = [[UIImageView alloc] initWithFrame:CGRectZero];
     NSDictionary * waist = [NSDictionary dictionaryWithObjectsAndKeys:@"exorcise",@"desperation", @"bigot",@"inefficiency", @"any",@"dissect", nil];
     float tackiness = 2188.0;
     UILabel * rock_bottom_appointment = [[UILabel alloc] init];
    UITableView * after_affection = UITableView.new;
    after_affection.alpha = 0.8;
    after_affection.backgroundColor = [UIColor colorWithRed:230 / 255.0 green:102 / 255.0 blue:132 / 255.0 alpha:0.2];
    after_affection.frame = CGRectMake(244, 105, 0, 0);
    after_affection.dataSource = nil;
    after_affection.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 0];
    after_affection.delegate = nil;
    brushwork_worthy.frame = CGRectMake(179, 211, 0, 0);
    brushwork_worthy.alpha = 0.7;
    brushwork_worthy.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:194 / 255.0 blue:244 / 255.0 alpha:0.3];
    brushwork_worthy.image = [UIImage imageNamed:@"libido"];
    brushwork_worthy.contentMode = UIViewContentModeScaleAspectFit;
    brushwork_worthy.animationRepeatCount = 3;
    rock_bottom_appointment.alpha = 0.1;
    rock_bottom_appointment.backgroundColor = [UIColor colorWithRed:135 / 255.0 green:29 / 255.0 blue:246 / 255.0 alpha:0.3];
    rock_bottom_appointment.frame = CGRectMake(277, 316, 0, 0);
    rock_bottom_appointment.text = @"";
    rock_bottom_appointment.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 0];
    rock_bottom_appointment.textAlignment = NSTextAlignmentCenter;
    rock_bottom_appointment.font = [UIFont systemFontOfSize:17];

    return after_affection;

}



/// my attr end

- (void)viewDidLoad {
 /// my attr start

         [self laugh_carve_restorative:@{@"duke":@(410), @"tombstone":@(326), @"tongs":@(865)} philanthropic:[NSArray arrayWithObjects:@(838), @(396), nil] sight:8052.0];
/// my attr end

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"StackView 垂直横向混合自动布局";
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建容器视图12
    stackView1 = [WHC_StackView new];
    stackView2 = [WHC_StackView new];
    
    stackView1.backgroundColor = [UIColor orangeColor];
    stackView2.backgroundColor = [UIColor magentaColor];
    
    [self.view addSubview:stackView2];
    [self.view addSubview:stackView1];
    
    // 容器视图1布局 添加约束
    [stackView1 whc_AutoWidth:0 top:64 right:0 height:150];
    [stackView1 whc_HeightEqualView:stackView2];
    
    /* 添加约束方式2
    stackView1.whc_LeftSpace(0).whc_TopSpace(64).whc_RightSpace(0).whc_Height(150);
     */
    
    // 容器视图1配置
    stackView1.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    stackView1.whc_Orientation = All;// 自动横向垂直混合布局
    stackView1.whc_HSpace = 10;
    stackView1.whc_VSpace = 10;
    stackView1.whc_Column = 2; // 每行2列
    
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
    stackView2.whc_LeftSpace(0).whc_TopSpaceToView(10,stackView1).whc_RightSpace(0).whc_BottomSpace(10);
    
    // 容器视图2配置
    stackView2.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    stackView2.whc_Orientation = All;// 自动横向垂直混合布局
    stackView2.whc_HSpace = 10;
    stackView2.whc_VSpace = 10;
    stackView2.whc_Column = 2; // 每行2列
    
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
    substackView21.whc_Orientation = All;// 自动横向垂直混合布局
    substackView21.whc_HSpace = 10;
    substackView21.whc_VSpace = 10;
    substackView21.whc_Column = 3; // 每行3列
    
    UIView * sublable211 = [UIView new];
    UIView * sublable212 = [UIView new];
    UIView * sublable213 = [UIView new];
    UIView * sublable214 = [UIView new];
    
    sublable211.backgroundColor = [UIColor grayColor];
    sublable212.backgroundColor = [UIColor grayColor];
    sublable213.backgroundColor = [UIColor grayColor];
    sublable214.backgroundColor = [UIColor grayColor];
    
    // 添加子元素到容器视图
    [substackView21 addSubview:sublable211];
    [substackView21 addSubview:sublable212];
    [substackView21 addSubview:sublable213];
    [substackView21 addSubview:sublable214];
    
    // 容器2视图子容器22配置
    substackView22.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10);
    substackView22.whc_Orientation = All;// 自动横向垂直混合布局
    substackView22.whc_HSpace = 10;
    substackView22.whc_VSpace = 10;
    substackView22.whc_Column = 3; // 每行3列
    
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
