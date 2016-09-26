
# XHTabBarSwift

#### 一行代码创建自定义TabBar,支持小红点,数字角标及自定义高度

[![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg?maxAge=2592000)](https://github.com/CoderZhuXH/XHTabBarSwift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/CoderZhuXH/XHTabBarSwift)
[![Version Status](https://img.shields.io/cocoapods/v/XHTabBarSwift.svg?style=flat)](http://cocoadocs.org/docsets/XHTabBarSwift)
![Support](https://img.shields.io/badge/support-iOS%208%2B-brightgreen.svg)
[![Pod Platform](https://img.shields.io/cocoapods/p/XHTabBarSwift.svg?style=flat)](http://cocoadocs.org/docsets/XHTabBarSwift)
[![Pod License](https://img.shields.io/cocoapods/l/XHTabBarSwift.svg?style=flat)](https://github.com/CoderZhuXH/XHTabBarSwift/blob/master/LICENSE)

==============

#### OC版请戳这里>>>  https://github.com/CoderZhuXH/XHTabBar

###技术交流群(群号:537476189).
## 效果
![image](https://raw.githubusercontent.com/CoderZhuXH/XHTabBar/master/DEMO.PNG)

## 使用方法
### 1.在Appdelegate 中初始化,并设置为根控制器
```swift
    /*
    控制器name数组
    */
    let  controllerArray = ["MainVC","MsgVC","FriendVC","MeVC"]
    /*
    title数组
    */
    let  titleArray = ["首页","消息","朋友","我的"]
    /*
    默认图片数组
    */
    let  imageArray = ["home_tabbar","msg_tabbar","friend_tabbar","me_tabbar"]
    /*
    选中图片数组
     */
    let  selImageArray = ["home_tabbar_sel","msg_tabbar_sel","friend_tabbar_sel","me_tabbar_sel"]
    /*
    tabbar高度最小值49.0, 传nil或<49.0均按49.0处理
    */
    let height = CGFloat(49)
        
    /*
    创建tabBarController
    */
    let tabBarController = XHTabBar(controllerArray:controllerArray,titleArray: titleArray,imageArray: imageArray,selImageArray: selImageArray,height:height)

    /*
    设置为根控制器    
    */
    window?.rootViewController = tabBarController
```
### 2.影藏tabBar
```swift
     /*
     push界面时,影藏tabBar,如下
     */
     let controller = UIViewController.init()
     controller.hidesBottomBarWhenPushed = true
     self.navigationController?.pushViewController(controller, animated: true)
```
### 3.角标、小红点及其他设置接口
```swift

     /**
     *  手动切换显示到指定控制器
     *
     *  - param: index 位置
     */
    public func showControllerIndex(_ index: Int)
    
    /**
     *  设置数字角标
     *
     *  - param: num   所要显示数字
     *  - param: index 位置
     */
    public func showBadgeMark(_ badge:: Int, index: Int)
        
    /**
     *  设置小红点
     *
     *  - param: index 位置
     */
    public func showPointMarkIndex(_ index: Int)
    
    /**
     *  影藏指定位置角标
     *
     *  - param: index 位置
     */
    public func hideMarkIndex(_ index: Int)

```
### 4.定义tabbar文字大小,颜色,请在XHTabBar.m 顶部修改下面值即可
```swift
/**
 *  tabbar背景色
 */
private let ColorTabBar = UIColor.white

/**
 *  title默认颜色
 */
private let ColorTitle = UIColor.gray

/**
 *  title选中颜色
 */
private let ColorTitleSel = ColorRGB(41,g: 167,b: 245)

/**
 *  title字体大小
 */
private let titleFontSize : CGFloat = 12.0

/**
 *  数字角标直径
 */
private let numMarkD:CGFloat = 20.0

/**
 *  小红点直径
 */
private let pointMarkD:CGFloat = 12.0

/**
 *  button 图片与文字上下占比
 */
private let scale:CGFloat = 0.55


```
##  安装
### 手动添加:<br>
*   1.将 XHTabBar 文件夹添加到工程目录中<br>

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHTabBarSwift'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 import XHTabBarSwift

### Tips
*   1.如果发现pod search XHTabBarSwift 搜索出来的不是最新版本，需要在终端执行cd desktop退回到desktop，然后执行pod setup命令更新本地spec缓存（需要几分钟），然后再搜索就可以了
*   2.如果你发现你执行pod install后,导入的不是最新版本,请删除Podfile.lock文件,在执行一次 pod install

## 注意
*  该项目通过 `动态获取命名空间` + `.` + `类名` 来创建类对象,如下:
```swift
let cls: AnyClass? = NSClassFromString(命名空间 + "." + 类名)
```
*  实测中发现,当命名空间中含有 ` - ` 等特殊字符时 创建类对象会为 `nil`
*  1.项目命名空间默认为项目名称.<br>
   2.当碰到类名称正确 创建类对象失败(即`报error:cls不能当做UIViewController错误时`)时,可以到TARGETS -> Build Settings ->Produce Name 中修改命名空间,去掉命名空间中 ` - ` 等特殊字符:
![image](https://github.com/CoderZhuXH/XHTabBarSwift/blob/master/ProductName.png)

##  系统要求
*   该项目最低支持 iOS 8.0 和 Xcode 8.0

##  许可证
    XHTabBarSwift 使用 MIT 许可证，详情见 LICENSE 文件
