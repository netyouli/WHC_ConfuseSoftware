# iOS自动代码翻新(混淆)专家   

## 最新版本：v1.9.2.2beta  

### 更新内容：
- 1.添加清除代码注释控制开关
- 2.优化UITableViewCell关联xib、storyborad翻新混淆
- 3.优化自动插入混淆函数以及调用生成的混淆函数算法(解决一个源文件定义多个类插入混淆函数编译报错问题)
- 4.优化函数名混淆(解决常量字符串和函数名一样时被翻新混淆掉问题)
- 5.优化sks资源文件和对应源文件名称统一
- 6.更改生成的混淆日志log.txt存放路径(现存放在加载项目的根目录下面)

更多历史更新记录请查看提交记录


<div align=center><img src="https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/logo.png" width = "100" height = "100"/></div></br>


-  iOS代码自动翻新(混淆)专家是一款新一代运行在MAC OS平台的App、完美支持Objc和Swift项目代码的自动翻新(混淆)、支持文件名、类名、方法名、属性名、添加混淆方法体、添加混淆属性、自动调用混淆方法等。。。功能强大而稳定。


Introduce
==============
-  ☑ 支持Swift、Objc项目
-  ☑ 支持文件名、类名、方法名、属性名、xib、storyborad关联方法名类名的翻新修改
-  ☑ 支持mp3、wav、png、jpg、jpeg、gif、Assets.xcassets里图片资源文件名自动翻新并同步到代码里
-  ☑ 支持添加混淆方法体、添加混淆属性
-  ☑ 支持自动调用生成的混淆方法体
-  ☑ 支持生成函数、属性名称翻新名称宏映射表(Objc特有功能)
-  ☑ 支持部分混淆(可选插入方法、可选插入属性、可选插入调用生成的方法体)
-  ☑ 支持生成并自动插入混淆函数体
-  ☑ 支持生成并自动插入混淆属性声明
-  ☑ 支持生成详情翻新日志文件(方便排查翻新后产生的编译错误)
-  ☑ 支持加载白名单(过滤不需要翻新的方法名、文件名、目录下子文件)
-  ☑ 支持在加载原路径项目下进行翻新
-  ☑ 支持在加载原路径项目下进行复制备份翻新

Video
==============
[视频翻新演示：](https://pan.baidu.com/s/1_ji0en1xhPd8s_zIrt2LEQ)https://pan.baidu.com/s/1_ji0en1xhPd8s_zIrt2LEQ

Require
==============
* Mac OS X 10.10+

Install
==============
* 下载该项目然后双击文件./ConfuseSoftware/ConfuseSoftware.dmg 安装文件

Usage
==============
查看翻新效果例子对比工程：./翻新之后App效果工程   ./翻新之前App效果工程

## 自动翻新iOS项目
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新1.png)

## 随机生成Objc方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新3.png)

## 随机生成Swift方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新2.png)



## 欢迎下载使用(*￣︶￣)