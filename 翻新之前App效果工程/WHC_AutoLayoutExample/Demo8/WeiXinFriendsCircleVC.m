//
//  WeiXinFriendsCircle.m
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "WeiXinFriendsCircleVC.h"
#import "WHC_AutoLayout.h"
#import "FriendsCircleCell.h"
#import "PersonImageView.h"
#import "FriendModel.h"
#import "WHC_KeyboradHeaderView.h"
#import "FooterView.h"

static  NSString * _Nonnull  kFirendsCircleCellIdentifier = @"FriendsCircleCell";
static  NSString * _Nonnull  kPersonImageCellIdentifier = @"PersonImageCell";
static  NSInteger kDefaultOnePageDataCount = 10;

@interface WeiXinFriendsCircleVC ()<UITableViewDataSource , UITableViewDelegate , FriendsCircleCellDelegate,UITextViewDelegate> {
    UITableView            * _friendTableView;
    NSMutableArray         * _friendModelArray;
    
    WHC_StackView          * _sendView;
    UITextView             * _sendTxt;
    WHC_KeyboradHeaderView * _keyBoradMonitorView;
    
    NSInteger                _currentAnswerRow;
    UIView                 * _lastAnswerLabel;
    FriendsCircleCell      * _currentAnswerCell;
    
    UIImageView            * _downRefreshImageView;
    NSInteger                _dateModelCount;
    BOOL                     _canDownRefresh;
    BOOL                     _refreshing;
}

@end

@implementation WeiXinFriendsCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"朋友圈";
    self.view.backgroundColor = [UIColor grayColor];
    _friendModelArray = [NSMutableArray array];
    _dateModelCount = kDefaultOnePageDataCount;
    [self initData];
    [self initLayout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _friendTableView.contentInset = UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initLayout {
    _friendTableView = [UITableView new];
    [self.view addSubview:_friendTableView];
    /// 上下左右间隙为0(全屏)
    [_friendTableView whc_AutoSize:0 top:0 right:0 bottom:0];
    _friendTableView.backgroundColor = [UIColor grayColor];
    _friendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _friendTableView.delegate = self;
    _friendTableView.dataSource = self;
    [_friendTableView registerNib:[UINib nibWithNibName:kPersonImageCellIdentifier bundle:nil]
           forCellReuseIdentifier:kPersonImageCellIdentifier];
    [_friendTableView registerClass:[FriendsCircleCell class]
             forCellReuseIdentifier:kFirendsCircleCellIdentifier];
    
    PersonImageView * headerView = [[NSBundle mainBundle] loadNibNamed:@"PersonImageView" owner:nil options:nil][0];
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 269);
    _friendTableView.tableHeaderView = headerView;
    
    FooterView * footerView = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil][0];
    footerView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 40);
    _friendTableView.tableFooterView = footerView;
    
    /// 下拉菊花
    _downRefreshImageView = [UIImageView new];
    [self.view addSubview:_downRefreshImageView];
    _downRefreshImageView.image = [UIImage imageNamed:@"AlbumReflashIcon"];
    [_downRefreshImageView whc_Frame:30 top:34 width:30 height:30];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _sendView = [WHC_StackView new];
        _sendView.backgroundColor = [UIColor whiteColor];
        _sendTxt = [UITextView new];
        _sendTxt.font = [UIFont systemFontOfSize:14];
        _sendTxt.delegate = self;
        _sendTxt.layer.cornerRadius = 4;
        _sendTxt.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        _sendTxt.returnKeyType = UIReturnKeySend;
        [self.view addSubview:_sendView];
        [_sendView addSubview:_sendTxt];
        
        _sendView.whc_Orientation = Vertical;
        _sendView.whc_Edge = UIEdgeInsetsMake(5, 5, 5, 5);
        
        /// 一行代码添加约束
        _sendView.whc_LeadingSpace(0)
        .whc_RightSpace(0)
        .whc_LastBaseLine(-40)
        .whc_Height(40);
        
        [_sendView whc_StartLayout];
        _keyBoradMonitorView = (WHC_KeyboradHeaderView *)[WHC_KeyboradHeaderView monitorKeyboradShowAddHeaderView:_sendView observer:self];
    });
    
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_friendTableView reloadData];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [_friendTableView reloadData];
}

- (void)initData {
    for (int i = 0; i < _dateModelCount; i++) {
        FriendModel * model = [FriendModel new];
        model.answerArray = [NSMutableArray array];
        model.userImage = @"me.jpg";
        model.userName = @"WHC";
        if (i % 2 == 0) {
            model.content = @"WHC_AutoLayoutKit目前最先进的自动布局框架,👌👌👌👌WHC_AutoLayoutKit目前最先进的自动布局框架,WHC_AutoLayoutKit目前最先进的自动布局框架,WHC_AutoLayoutKit目前最先进的自动布局框架,WHC_AutoLayoutKit目前最先进的自动布局框架,,WHC_AutoLayoutKit目前最先进的自动布局框架,,WHC_AutoLayoutKit目前最先进的自动布局框架";
            model.isSupper = YES;
        }else {
            model.content = @"WHC_AutoLayoutKit目前最先进的自动布局框架,👌👌👌👌WHC_AutoLayoutKit目前最先进的自动布局框架";
            model.isSupper = NO;
        }
        NSInteger imageCount = arc4random_uniform(6);
        NSMutableArray * imageArray = [NSMutableArray array];
        for (int j = 0; j < imageCount; j++) {
            [imageArray addObject:[NSString stringWithFormat:@"pic%d.jpg",j]];
            Answer * answer = [Answer new];
            if (j % 2) {
                answer.name = [NSString stringWithFormat:@"iOS%d",j];
                answer.content = @"WHC_AutoLayoutKit👌👌👌👌";
            }else {
                answer.name = [NSString stringWithFormat:@"android%d",j];
                answer.content = @"👌👌👌👌最先进的自动布局👌👌👌👌";
            }
            answer.isReply = j % 2;
            [model.answerArray addObject:answer];
        }
        model.imageArray = imageArray;
        [_friendModelArray addObject:model];
    }
}

- (CGFloat)stringHeight:(NSString *)content constrainedWidth:(CGFloat)width font:(UIFont *)font{
    CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
    return contentSize.height;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [_sendTxt resignFirstResponder];
        FriendModel * model = _friendModelArray[_currentAnswerRow];
        Answer * answer = [Answer new];
        answer.name = @"WHC";
        answer.isReply = YES;
        answer.content = _sendTxt.text;
        [model.answerArray addObject:answer];
        [_friendTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_currentAnswerRow inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        _sendTxt.text = nil;
        return NO;
    }else {
        CGFloat contentHeight = [self stringHeight:_sendTxt.text constrainedWidth:CGRectGetWidth(_sendTxt.frame) font:_sendTxt.font];
        CGFloat deffix = contentHeight - CGRectGetHeight(_sendTxt.frame) + 20;
        if (contentHeight < 30) {
            contentHeight = 30;
            deffix = 0;
        }else {
            contentHeight += 10;
        }
        [_sendView whc_Height:contentHeight + 10];
    }
    return YES;
}


/// 在进行评论的时候编辑框自动定位到该评论
- (void)friendsCircleCell:(FriendsCircleCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel {
    [_sendView whc_Height:40];
    [_sendTxt becomeFirstResponder];
    _currentAnswerCell = cell;
    _currentAnswerRow = row;
    _lastAnswerLabel = commentLabel;
    __weak typeof(self) weakSelf = self;
    __weak typeof(_sendView) weakSendView = _sendView;
    __weak typeof(_friendTableView) weakTableView = _friendTableView;
    _keyBoradMonitorView.keyboardWillShow = ^{
        CGRect answerRc = [commentLabel convertRect:commentLabel.bounds toView:weakSelf.view];
        CGRect sendRc = weakSendView.frame;
        CGFloat diffY = CGRectGetMaxY(answerRc) - CGRectGetMinY(sendRc);
        [weakTableView setContentOffset:CGPointMake(0, weakTableView.contentOffset.y + diffY) animated:YES];
    };
    
}

/// 点赞回调
- (void)friendsCircleSupperCell:(FriendsCircleCell *)cell {
    [_friendTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.row inSection:0]]
                            withRowAnimation:UITableViewRowAnimationNone];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _friendModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    FriendsCircleCell * cell = [tableView dequeueReusableCellWithIdentifier:kFirendsCircleCellIdentifier];
    cell.delegate = self;
    cell.row = row;
    cell.tableView = tableView;
    [cell setFriendModel:_friendModelArray[indexPath.row]];
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell whc_CellHeightForIndexPath:indexPath tableView:tableView identifier:kFirendsCircleCellIdentifier layoutBlock:^(UITableViewCell *cell) {
        [(FriendsCircleCell *)cell setFriendModel:_friendModelArray[indexPath.row]];
    }];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsety = -scrollView.contentOffset.y;
    
    /// 处理下拉刷新
    if (!_refreshing) {
        _downRefreshImageView.transform = CGAffineTransformMakeRotation(offsety / 50 * 2 * M_PI);
        [_downRefreshImageView whc_TopSpace:34 + offsety];
    }
    if (offsety > 50 && !_refreshing) {
        _canDownRefresh = YES;
        [_downRefreshImageView whc_TopSpace:34 + 50];
        _refreshing = YES;
        _downRefreshImageView.transform = CGAffineTransformIdentity;
        @autoreleasepool {
            CABasicAnimation * rotateAnimation = [CABasicAnimation new];
            rotateAnimation.keyPath = @"transform.rotation.z";
            rotateAnimation.fromValue = @0;
            rotateAnimation.toValue = @(M_PI * 2);
            rotateAnimation.duration = 1.0;
            rotateAnimation.repeatCount = INFINITY;
            [_downRefreshImageView.layer addAnimation:rotateAnimation forKey:@"_rotateAnimation"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _refreshing = NO;
                _canDownRefresh = NO;
                [_downRefreshImageView.layer removeAllAnimations];
                [_downRefreshImageView whc_TopSpace:34];
                [_downRefreshImageView updateConstraintsIfNeeded];
                [UIView animateWithDuration:0.3 animations:^{
                    [_downRefreshImageView layoutIfNeeded];
                }completion:^(BOOL finished) {
                    [_friendModelArray removeAllObjects];
                    _dateModelCount = kDefaultOnePageDataCount;
                    [self initData];
                    [_friendTableView reloadData];
                }];
            });
        }
    }
    /// 处理上拉刷新
    if (offsety < 0 && offsety < -(scrollView.contentSize.height - CGRectGetHeight(_friendTableView.frame))) {
        if (!_refreshing) {
            _refreshing = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _refreshing = NO;
                _dateModelCount += kDefaultOnePageDataCount;
                [self initData];
                [_friendTableView reloadData];
            });
        }
    }
}
@end
