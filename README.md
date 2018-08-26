# iOS自动代码翻新(混淆)专家
<div align=center><img src="https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/WHC_AutoLayoutLogo.png" width = "100" height = "100"/></div></br>


-  iOS代码自动翻新(混淆)专家是一款新一代运行在MAC OS平台的App、完美支持Objc和Swift项目代码的自动翻新(混淆)、支持文件名、类名、方法名、属性名、添加混淆方法体、添加混淆属性、自动调用混淆方法等。。。功能强大而稳定。


Introduce
==============
-  支持Swift、Objc项目
-  支持文件名、类名、方法名、属性名翻新修改
-  支持添加混淆方法体、添加混淆属性
-  支持自动调用生成的混淆方法体
-  支持生成函数、属性名称翻新名称宏映射表(Objc特有功能)
-  支持部分混淆(可选插入方法、可选插入属性、可选插入调用生成的方法体)
-  支持生成并自动插入混淆函数体
-  支持生成并自动插入混淆属性声明
-  支持生成详情翻新日志文件(方便排查)
-  支持加载白名单(过滤不需要翻新的方法名、文件名、目录下子文件)
-  支持在加载原路径项目下进行翻新
-  支持在加载原路径项目下进行复制备份翻新

Require
==============
* Mac OS X 10.10+

Install
==============
* 双击文件./ConfuseSoftware/ConfuseSoftware.dmg 安装文件

Usage
==============

## Automatic height view
![](https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/autoHeight.gif)

```objective-c
view.whc_LeftSpace(10)
    .whc_TopSpace(10)
    .whc_RightSpace(10)
    .whc_HeightAuto();
```

## Use lessEqual or greaterEqual (width <= 100 && width >= 20)
```objective-c
view.whc_Width(100).whc_LessOrEqual()
    .whc_Width(20).whc_GreaterOrEqual()
```

## Masonry/SnapKit update the constraint way unfriendly
```objective-c
[view mas_updateConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(superview.mas_top).with.offset(10); 
    make.left.equalTo(superview.mas_left).with.offset(20);
    make.bottom.equalTo(superview.mas_bottom).with.offset(-10);
    make.right.equalTo(superview.mas_right).with.offset(-10);
}];
```

## Update the view constraints
Modify the view to the left from 20 other views
```objective-c
view.whc_LeftSpace(20);
// or
view.whc_LeftSpaceToView(20,otherView);
```

## Can be directly modified constraints on the Xib and Storyboard
If the view of xib leading now amended as left constraints
```objective-c
/// First remove the xib view of leading and then add new constraints
view.whc_RemoveLayoutAttrs(NSLayoutAttributeLeading)
    .whc_LeftSpace(10);
```

## Remove the constraint

Remove all constraints associated with view left
```objective-c
view.whc_RemoveLayoutAttrs(NSLayoutAttributeLeft);
```
To remove multiple constraints associated with view
```objective-c
view.whc_RemoveLayoutAttrs(NSLayoutAttributeLeft,NSLayoutAttributeLeading,NSLayoutAttributeTop);
// or 
view.whc_RemoveTo(linkView, attrs: NSLayoutAttributeLeft ...);
```

## Modify the view constraint priority

Modify the view constraint for low priority right
```objective-c
view.whc_RightSpace(10)
    .whc_PriorityLow();
```

```objective-c
// The higher the priority, the less likely to be stretched
// 设置抗拉伸优先级,优先级越高越不容易被拉伸
label.whc_ContentHuggingPriority(UILayoutPriorityDefaultLow, UILayoutConstraintAxisHorizontal);

// 设置抗压缩优先级,优先级越高越不容易被压缩
// Compression priority, the higher the priority the less easy to be compressed
label.whc_ContentCompressionResistancePriority(UILayoutPriorityDefaultLow, UILayoutConstraintAxisHorizontal);
```

## One line of code calculation cell height

No reuse way calculated cell height
```objective-c
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell whc_CellHeightForIndexPath:indexPath tableView:tableView];
}
```

Reuse way calculated cell height
```objective-c
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell whc_CellHeightForIndexPath:indexPath 
                                             tableView:tableView 
                                            identifier:@"kFirendsCircleCellIdentifier" 
                                           layoutBlock:^(UITableViewCell *cell) {
         /// use model layout cell
         [(FriendsCircleCell *)cell setFriendModel:_friendModelArray[indexPath.row]];
    }];
}
```
## Use WHC_StackView

Create WHC_StackView
```objective-c
WHC_StackView * stackView = [WHC_StackView new];
[self.view addSubview: stackView];
```

Add constraint
```objective-c
stackView.whc_LeftSpace(10)
         .whc_TopSpace(10)
         .whc_RightSpace(10)
         .whc_HeightAuto();
```

Configuration stackView

**1.** Set the padding
```objective-c
stackView.whc_Edge = UIEdgeInsetsMake(10, 10, 10, 10); // 内边距
```
**2.** Set the layout direction
```objective-c
stackView.whc_Orientation = Vertical;                  // 自动垂直布局
```
**3.** Set the child views lateral clearance
```objective-c
stackView.whc_HSpace = 10;                             // 子视图横向间隙
```
**4.** Set the child views vertical clearance
```objective-c
stackView.whc_VSpace = 10;                             // 子视图垂直间隙
```
**5.** Add subview and start the layout 
```objective-c
for (int i = 0; i < 4; i++) {
    UIView * view = [UIView new];
    [stackView addSubview:view];        
}
[stackView whc_StartLayout];
```
Prompt
==============

For more UI layout automatically, WHC_StackView components, one line of code to calculate the cell height module, please download this demo to check the specific usage

Part of the WHC_AutoLayoutKit demo show
==============
<img src = "https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/c.png" width = "375"><img src = "https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/g.png" width = "375">
![](https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/f.gif)![](https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/a.gif)![](https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/swiftb.gif)![image](https://github.com/netyouli/WHC_AutoLayoutKit/blob/master/Gif/d.png)

Licenses
==============
All source code is licensed under the MIT License.

