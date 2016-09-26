//
//  MainVC.swift
//  XHTabBarExampleSwift
//
//  Created by xiaohui on 16/8/8.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
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

    fileprivate lazy var pushButton:UIButton = {
        
        let button = UIButton(type: UIButtonType.custom)
        button.bounds = CGRect(x: 0,y: 0,width: 100,height: 40)
        button.center = self.view.center
        button.setTitle("Push", for: UIControlState())
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action:#selector(MainVC.pushAction), for: UIControlEvents.touchUpInside)
        return button;
    }()
    
    @objc fileprivate func pushAction()
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
