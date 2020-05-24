<!--
 * @Author: whc
 * @Date: 2019-02-23 09:39:29
 * @LastEditTime: 2019-10-20 16:37:39
 -->

# iOS代码混淆v1.9.8.2.3

<div align=center><img src="https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/logo.png" width = "100" height = "100"/></div></br>


该软件主要解决机器审核4.3、2.1（使用模拟人工手动混淆模式防止出现因为混淆原因出现2.3.1）

- 1.加强属性混淆防止误修改同步xib,sb关联属性
- 2.优化u3d，coco2dx生成c，c++函数数量
- 3.支持完全自定义属性，函数名，文件名词典集合
- 4.支持自动混淆生成oc，swift垃圾代码文件并且是互相引用调用，同时自动融合到混淆的项目里面引用调用，无需手动操作

### v1.9.8.2.3更新内容：
- 1.优化属性混淆，支持c++属性
- 2.优化加强其他混淆
- 3.增强生成混淆函数体结构复杂度和真实随机选（swift，oc，c++）
- 4.增加自动调用生成的混淆函数复杂度和真实随机选（swift，oc，c++）
- 5.优化u3d游戏c++混淆（c++函数生成自动调用）
- 6.支持混淆指定的文件夹和文件代码 (配置文件里面配置)
- 7.支持忽略混淆指定的文件夹和文件代码 (配置文件里面配置)



查看更多：[🔍查看更多历史更新记录](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/history_readme.md)

Introduce
==============
-  ☑ 支持Swift、Objc、u3d、cocos2dx项目、cpp文件名类名修改翻新混淆
-  ☑ 支持项目文件夹名称自动修改
-  ☑ 支持多线程混淆、自动根据电脑配置开启合适线程数量进行混淆
-  ☑ 支持自动混淆生成oc，swift垃圾代码文件并且是互相引用调用，同时自动融合到混淆的项目里面引用调用，无需手动操作
-  ☑ 支持自动修改资源文件hash值(png,jpg,jpeg,mp3,mp4,caf)
-  ☑ 支持一键项目克隆功能修改代码文件的uuid（自动创建指定名称的项目并克隆指定项目里代码库依赖配置、支持Pod）、类似React-Native构建工具自动生成指定名称Xcode工程
-  ☑ 支持swift、objc项目字符串混淆加密(支持中文英文符号表情符号混淆加密)
-  ☑ 支持文件名、类名、方法名、属性名、xib、storyborad关联方法名类名的翻新修改
-  ☑ 支持mp3、wav、png、jpg、jpeg、gif、Assets.xcassets里图片资源文件名自动翻新并同步到代码里
-  ☑ 支持添加混淆方法体、添加混淆属性
-  ☑ 支持自动调用生成的混淆方法体
-  ☑ 支持生成函数、属性名称翻新混淆
-  ☑ 支持部分混淆(可选插入方法、可选插入属性、可选插入调用生成的方法体)
-  ☑ 支持生成并自动插入混淆函数体
-  ☑ 支持生成并自动插入混淆属性声明
-  ☑ 支持生成详情翻新日志文件(方便排查翻新后产生的编译错误)
-  ☑ 支持加载混淆配置(过滤不需要翻新的方法名、文件名、目录下子文件)
-  ☑ 支持混淆指定的文件夹和文件代码
-  ☑ 支持忽略混淆指定的文件夹和文件代码


Note
==============
- 使用Xcode10加载混淆项目，在混淆之前最好关闭工程，混淆完成了再打开工程，避免Xcode10上面文件名爆红错误

Video
==============
[视频翻新演示：](video)https://pan.baidu.com/s/1_ji0en1xhPd8s_zIrt2LEQ

## 混淆C++
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/cpp.png)

## 一键克隆项目
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/clone.png)

## 动态混淆演示
![](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/demo.gif)

## 手动加解密字符串
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/字符串加密.png)

## 字符串加密混淆反编译前后对比
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/1.png)![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/2.png)

## 自动翻新iOS项目
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新1.png)

## 随机生成Objc方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新3.png)

## 随机生成Swift方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新2.png)

## 注：该项目不是开源免费使用的软件，如果想要免费开源的用户请慎重下载本项目，目前下载使用是需要购买Vip才能使用，具体详情请咨询作者，谢谢！
