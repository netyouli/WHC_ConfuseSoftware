//
//  DemoVC6.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/1.
//  Copyright © 2016年 吴海超. All rights reserved.
//
/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "DemoVC6.h"
#import "WHC_AutoLayout.h"

@interface DemoVC6 ()

@end

@implementation DemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"WHC_StackView支持分割线设置";
    
    /// 样式1
    WHC_StackView * stackView = WHC_StackView.new;
    [self.view addSubview: stackView];
    stackView.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpace(100)
    .whc_Height(50);
    
    for (NSInteger i = 0; i < 5; i++) {
        [stackView addSubview:[self makeLabel:@(i + 1).stringValue]];
    }
    stackView.whc_Column = 4;
    stackView.whc_Orientation = Horizontal;
    stackView.whc_SegmentLineSize = 0.5;
    [stackView whc_StartLayout];
    
    
    /// 样式2
    WHC_StackView * stackView1 = WHC_StackView.new;
    [self.view addSubview: stackView1];
    stackView1.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpaceToView(20,stackView)
    .whc_Height(160);
    
    for (NSInteger i = 0; i < 5; i++) {
        [stackView1 addSubview:[self makeLabel:@(i + 1).stringValue]];
    }
    stackView1.whc_Column = 4;
    stackView1.whc_Orientation = Vertical;
    stackView1.whc_SegmentLineSize = 0.5;
    [stackView1 whc_StartLayout];
    
    
    /// 样式3
    WHC_StackView * stackView2 = WHC_StackView.new;
    [self.view addSubview:stackView2];
    stackView2.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpaceToView(20,stackView1)
    .whc_Height(160);
    
    for(NSInteger i = 0; i < 16; i++) {
        [stackView2 addSubview:[self makeLabel:@(i + 1).stringValue]];
    }
    stackView2.whc_Column = 4;
    stackView2.whc_Orientation = All;
    stackView2.whc_SegmentLineSize = 0.5;
    [stackView2 whc_StartLayout];
    
    [self setBorder: stackView];
    [self setBorder: stackView1];
    [self setBorder: stackView2];
}

- (UILabel *)makeLabel:(NSString *) title {
    UILabel * label = UILabel.new;
    label.text = title;
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
    
}

- (void)setBorder:(WHC_StackView *)stackView {
    stackView.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:1].CGColor;
    stackView.layer.borderWidth = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
