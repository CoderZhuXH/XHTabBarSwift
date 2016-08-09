//
//  AppDelegate.swift
//  XHTabBarExampleSwift
//
//  Created by xiaohui on 16/8/8.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHTabBar-Swift

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        
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
        
        /**
         *  设为根控制器
         */
        window?.rootViewController = tabBarController
        
        /*
         设置数字角标(可选)
         */
        tabBarController.showBadgeMark(100, index: 1)
                
        /*
         设置小红点(可选)
         */
        tabBarController.showPointMarkIndex(2)
        
        /*
         不显示小红点/数字角标(可选)
         */
        //tabBarController.hideMarkIndex(3)
        
        /*
         手动切换tabBarController 显示到指定控制器(可选)
         */
        //tabBarController.showControllerIndex(3)
        

        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

