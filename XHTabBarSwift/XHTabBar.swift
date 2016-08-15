//
//  XHTabBar.swift
//  XHTabBarExampleSwift
//
//  Created by xiaohui on 16/8/8.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHTabBarSwift

import UIKit

/**
 *  RGBA颜色
 */
func ColorRGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    
    return UIColor(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:a)
}
/**
 *  RGB颜色
 */
func ColorRGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return ColorRGBA(r, g: g, b: b, a: 1.0)
}
/**
 *  随机色
 */
func ColorRandom() -> UIColor {
    
    return ColorRGB(CGFloat(arc4random()%255), g: CGFloat(arc4random()%255), b: CGFloat(arc4random()%255))
}
/**
 *  屏幕宽度
 */
private let MWIDTH = UIScreen.mainScreen().bounds.size.width

/**
 *  屏幕高度
 */
private let MHEIGHT = UIScreen.mainScreen().bounds.size.height

/**
 *  tabbar背景色
 */
private let ColorTabBar = UIColor.whiteColor()

/**
 *  title默认颜色
 */
private let ColorTitle = UIColor.grayColor()

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


extension XHTabBar{

    /**
     *  切换显示控制器
     *
     *  - param: index 位置
     */
    public func showControllerIndex(index: Int) {
        
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        self.seleBtn!.selected = false
        let button = (cusTabbar.viewWithTag(1000+index) as? UIButton)!
        button.selected = true
        self.seleBtn = button
        self.selectedIndex = index
    }
    
    /**
     *  设置数字角标
     *
     *  - param: num   所要显示数字
     *  - param: index 位置
     */
    public func showBadgeMark(badge: Int, index: Int) {
        
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.hidden = false
        var nFrame = numLabel.frame
        if badge <= 0 {
            //隐藏角标
            self.hideMarkIndex(index)
            
        } else {
            
            if badge > 0 && badge <= 9 {
                
                nFrame.size.width = numMarkD
                
            } else if badge > 9 && badge <= 19 {
                
                nFrame.size.width = numMarkD+5
                
            } else {
                
                nFrame.size.width = numMarkD+10
                
            }
            nFrame.size.height = numMarkD
            numLabel.frame = nFrame
            numLabel.layer.cornerRadius = numMarkD/2.0
            numLabel.text = "\(badge)"
            if badge > 99 {
                numLabel.text = "99+"
            }
            
        }
    }
    
    /**
     *  设置小红点
     *
     *  - param: index 位置
     */
    public func showPointMarkIndex(index: Int) {
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.hidden = false
        var nFrame = numLabel.frame
        nFrame.size.height = pointMarkD
        nFrame.size.width = pointMarkD
        numLabel.frame = nFrame
        numLabel.layer.cornerRadius = pointMarkD/2.0
        numLabel.text = ""
    }
    
    /**
     *  影藏指定位置角标
     *
     *  - param: index 位置
     */
    public func hideMarkIndex(index: Int) {
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.hidden = true
    }
    
}
//MARK: - TabBarButton
class XHTabBarButton:UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        titleLabel?.textAlignment = NSTextAlignment.Center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let newX:CGFloat = 0.0
        let newY:CGFloat = 5.0
        let newWidth:CGFloat = CGFloat(contentRect.size.width)
        let newHeight:CGFloat = CGFloat(contentRect.size.height)*scale-newY
        return CGRectMake(newX, newY, newWidth, newHeight)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*scale
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*scale
        return CGRectMake(newX, newY, newWidth, newHeight)
    }
    
}

//MARK: - TabBarController
public class XHTabBar:UITabBarController {
    
    var seleBtn: UIButton?
    var tabBarHeight:CGFloat = 49.0
    var titleArray = [String]()
    var imageArray = [String]()
    var selImageArray = [String]()
    var controllerArray = [String]()
    
    
   public init(controllerArray: [String], titleArray: [String],imageArray: [String],selImageArray: [String],height: CGFloat?) {
        
        self.controllerArray = controllerArray
        self.titleArray = titleArray
        self.imageArray = imageArray
        self.selImageArray = selImageArray
        
        if let tempHeight = height
        {
            tabBarHeight = tempHeight;
        }
        if tabBarHeight < 49.0
        {
            tabBarHeight = 49.0
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        addController()
        self.tabBar.addSubview(cusTabbar)
        addTabBarButton()
        setupTabbarLine()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     添加控制器
     */
    private func addController(){
        
        guard controllerArray.count > 0 else
        {
            print("error:控制器数组为nil")
            return
        }
        
        var navArray = [UIViewController]()
        //获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        for className in controllerArray {
            
            // 将类名转化为类
            let cls: AnyClass? = NSClassFromString(ns + "." + className)

            //Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
            guard let vcCls = cls as? UIViewController.Type else
            {
                print("error:cls不能当做UIViewController")
                return
            }
            let vc = vcCls.init()
            let nav = UINavigationController(rootViewController:vc)
            navArray.append(nav)
        }
        
        self.viewControllers  = navArray;
    }
    
    /**
     添加tabbarButton
     */
    private func addTabBarButton()
    {
        let num = controllerArray.count
        for i in 0..<num {
            
            let  width = UIScreen.mainScreen().bounds.size.width
            let  x = CGFloat(width/CGFloat(num)*CGFloat(i))
            let  y:CGFloat = 0.0
            let  w = width/CGFloat(num)
            let  h = tabBarHeight
            let button = XHTabBarButton(frame:CGRectMake(x,y,w,h))
            
            button.tag = 1000+i
            button.setTitleColor(ColorTitle, forState: UIControlState.Normal)
            button.setTitleColor(ColorTitleSel, forState: UIControlState.Selected)
            button.titleLabel?.font = UIFont.systemFontOfSize(titleFontSize)
            button.setImage(UIImage.init(named:self.imageArray[i]), forState: UIControlState.Normal)
            button.setImage(UIImage.init(named: self.selImageArray[i]), forState: UIControlState.Selected)
            button.setTitle(self.titleArray[i], forState: UIControlState.Normal)
            button.addTarget(self, action:#selector(buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            cusTabbar.addSubview(button)
            
            //默认选中
            if i == 0 {
                
                button.selected = true
                self.seleBtn = button
            }
            
            //角标
            let numLabel = UILabel(frame: CGRectMake(button.frame.size.width/2.0+6, 3, numMarkD, numMarkD))
            numLabel.layer.masksToBounds = true
            numLabel.layer.cornerRadius = 10
            numLabel.backgroundColor = UIColor.redColor()
            numLabel.textColor = UIColor.whiteColor()
            numLabel.textAlignment = NSTextAlignment.Center
            numLabel.font = UIFont.systemFontOfSize(13)
            numLabel.tag = 1020+i
            numLabel.hidden = true
            button.addSubview(numLabel)
        }
    }
    
    
    /**
     处理高度>49 tabbar顶部线
     */
    private func setupTabbarLine()
    {
        guard tabBarHeight > 49 else
        {
            return;
        }
        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.backgroundImage = UIImage.init()
        let line = UILabel(frame: CGRectMake(0, 0,MWIDTH, 0.5))
        line.backgroundColor = UIColor.lightGrayColor()
        cusTabbar.addSubview(line)
    }
    
    //MARK: - Action
    @objc private func buttonAction(button: UIButton) {
        let index: Int = button.tag-1000
        self.showControllerIndex(index)
    }

    //MARK: - 懒加载
    private lazy var cusTabbar: UIView = {
        
        let x = CGFloat(0)
        let y = 49.0 - self.tabBarHeight
        let width = MWIDTH
        let height = self.tabBarHeight
        
        let view = UIView(frame:CGRectMake(x,y,width,height))
        view.backgroundColor = ColorTabBar
        
        return view
    }()
    
}