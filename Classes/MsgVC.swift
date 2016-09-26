//
//  MsgVC.swift
//  XHTabBarExampleSwift
//
//  Created by xiaohui on 16/8/8.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//

import UIKit

class MsgVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "消息"
        
        self.view.backgroundColor = ColorRandom()//随机色
        
        // Do any additional setup after loading the view.
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
