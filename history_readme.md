# iOS代码混淆专家-历史更新记录   
### v1.9.3.6更新内容：
- 1.添加手动加密、解密字符串、生成objc、swift解密函数
- 2.修复混淆项目目录下图片2倍图和3倍图名称不一样的问题
- 3.修复pch文件混淆出现Unicode字符问题
- 4.添加一些关键字过滤

### v1.9.3.5beta更新内容：
- 1.修复源代码有emoji字符替换代码中带中文名称图片资源失败的情况

### v1.9.3.4beta更新内容：
- 1.修复objc属性自定义getter、setter名称混淆错误bug

### v1.9.3.3beta更新内容：
- 1.添加支持u3d项目打包生成后的xcode工程代码混淆
- 2.修复项目目录下图片特殊名字混淆不到的情况
- 3.优化模拟人工手动混淆相关名字生成方式（更逼真）
- 4.优化模拟人工混淆模式下objc/swift的函数名称混淆算法
- 5.增加白名单json格式检查，已经加载白名单时自动过滤白名单注释说明字符串

### v1.9.3.2beta更新内容：
- 1.修复自动登录失败问题
- 2.修复更新项目配置出现特需文件名更新失败导致爆红问题

### v1.9.3.1beta更新内容：
- 1.添加模拟人工手动混淆模式（防止混淆后出现2.3.1）
- 2.升级混淆模式二算法（swift、objc函数名称混淆更准确稳定）
- 3.内置iOS系统大量系统类函数名过滤白名单
- 4.调整objc、swift自动生成函数策略（防止混淆后出现2.3.1）

### v1.9.3.0beta更新内容：
- 1.添加只修改Asserts图片文件名称模式
- 2.修复项目函数互相替换混淆方式出现函数名重复bug

### v1.9.2.9beta更新内容：
- 1.添加新函数混淆模式(获取加载混淆的项目里面所有函数名互相随机替换)

### v1.9.2.8beta更新内容：
- 1.调整UI布局添加混淆实时输出状态窗口
- 2.优化混淆模式一下Objc函数名混淆对带下划线属性的处理
- 3.针对大型项目增加：混淆模式二(常规)、该模式下将严格隔离函数名和属性(包含系统类属性)的混淆

### v1.9.2.7beta更新内容：
- 1.修复原项目混淆Objc的category文件名爆红bug
- 2.优化文件名类名混淆生成方式,全部添加随机大写字符前缀

### v1.9.2.6beta更新内容：
- 1.修复项目配置文件文件名修改失败bug
- 2.优化Objc一个源文件定义多个类提取class顺序错误bug
- 3.优化字符串加密（支持指定字符串加密，支持字符串加密白名单过滤）

### v1.9.2.5beta更新内容：
- 1.优化objc的系统内置class的category类名过滤，优化项目配置文件文件名搜索

### v1.9.2.4beta更新内容：
- 1.添加swift、objc项目字符串混淆加密功能(支持中文、英文、符号、表情符号混淆加密处理)

### v1.9.2.3beta更新内容：
- 1.优化Objc的Category的混淆，优化Objc函数名称的提取

### v1.9.2.2beta更新内容：
- 1.修复混淆其他包时Assert路径引用依然是上个包的、引起错误混淆

### v1.9.2.1beta更新内容：
- 1.添加清除代码注释控制开关
- 2.优化UITableViewCell关联xib、storyborad翻新混淆
- 3.优化自动插入混淆函数以及调用生成的混淆函数算法(解决一个源文件定义多个类插入混淆函数编译报错问题)
- 4.优化函数名混淆(解决常量字符串和函数名一样时被翻新混淆掉问题)
- 5.优化sks资源文件和对应源文件名称统一
- 6.更改生成的混淆日志log.txt存放路径(现存放在加载项目的根目录下面)

更多历史更新记录请查看提交记录


Introduce
==============
-  ☑ 支持Swift、Objc项目
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

## 动态混淆演示
![](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/demo.gif)

## 字符串加密混淆反编译前后对比
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/1.png)![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/2.png)

## 自动翻新iOS项目
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新1.png)

## 随机生成Objc方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新3.png)

## 随机生成Swift方法
![image](https://github.com/netyouli/WHC_ConfuseSoftware/blob/master/ConfuseSoftware/翻新2.png)



## 欢迎下载使用(*￣︶￣)