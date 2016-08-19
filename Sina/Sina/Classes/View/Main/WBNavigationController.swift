//
//  WBNavigationController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.hidden = true
    }
//    重写push方法
    override func pushViewController(viewController: UIViewController, animated: Bool) {

//        隐藏tabbar(出了栈底控制器)
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //判断控制器的类型
            if let vc = viewController as? WBBaseViewController {
                var title:String? = "返回"
                
                if childViewControllers.count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                 }
                //取到item
                vc.navitem.leftBarButtonItem = UIBarButtonItem(title: title!, target: self, action: #selector(popBackToPresent),isBack:true)

            }
        }
        super.pushViewController(viewController, animated: true)

    }
    
    @objc private func popBackToPresent(){
        popViewControllerAnimated(true)
    }
}
