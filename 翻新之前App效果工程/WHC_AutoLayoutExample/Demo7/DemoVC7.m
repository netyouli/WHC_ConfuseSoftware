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

#import "DemoVC7.h"
#import "WHC_AutoLayout.h"

@interface DemoVC7 ()

@property (nonatomic, strong) UIView * view1;
@property (nonatomic, strong) UIView * view2;
@property (nonatomic, strong) UIView * view3;

@property (nonatomic, strong) UILayoutGuide * guide1;
@property (nonatomic, strong) UILayoutGuide * guide2;
@property (nonatomic, strong) UILayoutGuide * guide3;
@end

@implementation DemoVC7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"safeAreaLayoutGuide";
    self.view.backgroundColor = [UIColor whiteColor];
    [self make];
    
    _guide1.whc_LeftSpace(10)
    .whc_TopSpace(0)
    .whc_RightSpace(10)
    .whc_Height(30);
    
    _view1.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpaceToView(0, _guide1)
    .whc_Height(50);
    
    _guide2.whc_LeftSpace(10)
    .whc_TopSpaceToView(0, _view1)
    .whc_RightSpace(10)
    .whc_HeightEqualView(_guide1);
    
    _view2.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpaceToView(0, _guide2)
    .whc_HeightEqualView(_view1);
    
    _guide3.whc_LeftSpace(10)
    .whc_TopSpaceToView(0, _view2)
    .whc_RightSpace(10)
    .whc_HeightEqualView(_guide2);
    
    _view3.whc_LeftSpace(10)
    .whc_RightSpace(10)
    .whc_TopSpaceToView(0, _guide3)
    .whc_HeightEqualView(_view2);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)make {
    _view1 = [UIView new];
    _view1.translatesAutoresizingMaskIntoConstraints = NO;
    _view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_view1];
    
    _view2 = [UIView new];
    _view2.translatesAutoresizingMaskIntoConstraints = NO;
    _view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view2];
    
    _view3 = [UIView new];
    _view3.translatesAutoresizingMaskIntoConstraints = NO;
    _view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_view3];
    
    _guide1 = [UILayoutGuide new];
    [self.view addLayoutGuide:_guide1];
    _guide2 = [UILayoutGuide new];
    [self.view addLayoutGuide:_guide2];
    _guide3 = [UILayoutGuide new];
    [self.view addLayoutGuide:_guide3];
}


@end

