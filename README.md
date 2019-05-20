# iOS代码混淆v1.9.6.8   

<div align=center><img src="https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/logo.png" width = "100" height = "100"/></div></br>


该软件主要解决机器审核4.3、2.1（使用模拟人工手动混淆模式防止出现因为混淆原因出现2.3.1）

### v1.9.6.8更新内容：
- 1.优化u3d，coco2dx生成c，c++函数数量
- 2.支持完全自定义属性，函数名，文件名词典集合
- 3.支持自动混淆生成oc，swift垃圾代码文件并且是互相引用调用，同时自动融合到混淆的项目里面引用调用，无需手动操作
- 4.修复在混淆swift特需项目生成swift垃圾文件卡死情况
- 5.修复在混淆自动融合生成的垃圾代码文件因多线程导致融合错误问题



查看更多：[🔍查看更多历史更新记录](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/history_readme.md)

Introduce
==============
-  ☑ 支持Swift、Objc、u3d、cocos2dx项目、cpp文件名类名修改翻新混淆
-  ☑ 支持多线程混淆、自动根据电脑配置开启合适线程数量进行混淆
-  ☑ 支持自动混淆生成oc，swift垃圾代码文件并且是互相引用调用，同时自动融合到混淆的项目里面引用调用，无需手动操作
-  ☑ 支持自动修改资源文件hash值(png,jpg,jpeg,mp3,mp4,caf)
-  ☑ 支持一键项目克隆功能（自动创建指定名称的项目并克隆指定项目里代码库依赖配置、支持Pod）、类似React-Native构建工具自动生成指定名称Xcode工程
-  ☑ 支持swift、objc项目字符串混淆加密(支持中文英文符号表情符号混淆加密)
-  ☑ 支持文件名、类名、方法名、属性名、xib、storyborad关联方法名类名的翻新修改
-  ☑ 支持mp3、wav、png、jpg、jpeg、gif、Assets.xcassets里图片资源文件名自动翻新并同步到代码里
-  ☑ 支持添加混淆方法体、添加混淆属性
-  ☑ 支持自动调用生成的混淆方法体
-  ☑ 支持生成函数、属性名称翻新混淆名称宏映射表(Objc特有功能)
-  ☑ 支持部分混淆(可选插入方法、可选插入属性、可选插入调用生成的方法体)
-  ☑ 支持生成并自动插入混淆函数体
-  ☑ 支持生成并自动插入混淆属性声明
-  ☑ 支持生成详情翻新日志文件(方便排查翻新后产生的编译错误)
-  ☑ 支持加载白名单(过滤不需要翻新的方法名、文件名、目录下子文件)
-  ☑ 支持在加载原路径项目下进行翻新
-  ☑ 支持在加载原路径项目下进行复制备份翻新

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
