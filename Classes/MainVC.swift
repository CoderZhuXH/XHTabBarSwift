//
//  MainVC.swift
//  XHTabBarExampleSwift
//
//  Created by xiaohui on 16/8/8.
//  Copyright © 2016年 qiantou. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "首页"
        
        self.view.backgroundColor = ColorRandom()//随机色
        
        self.view.addSubview(pushButton)
        
        // Do any additional setup after loading the view.
    }

    private lazy var pushButton:UIButton = {
        
        let button = UIButton(type: UIButtonType.Custom)
        button.bounds = CGRectMake(0,0,100,40)
        button.center = self.view.center
        button.setTitle("Push", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.orangeColor()
        button.addTarget(self, action:#selector(MainVC.pushAction), forControlEvents: UIControlEvents.TouchUpInside)
        return button;
    }()
    
    @objc private func pushAction()
    {
        
        let controller = UIViewController.init()
        controller.view.backgroundColor = ColorRandom()//随机色
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
