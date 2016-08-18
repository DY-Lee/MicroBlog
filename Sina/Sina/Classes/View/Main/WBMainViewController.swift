//
//  WBMainViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let array = [["clsName":"WBHomeViewController" ,"title":"首页" ,"imageName":""],]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict))
        }
        viewControllers = arrayM
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension WBMainViewController {
    private func setupChildControllers() {
        
    }
    //取得字典内容
    private func controller(dict: [String :String])->UIViewController{
        guard let clsName = dict["clsName"] ,
                    title = dict["title"] ,
                    imageName = dict["imageName"],
                    cls = NSClassFromString(NSBundle.mainBundle().namespace + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController()
        }
    //创建视图控制器
//        1)将 clsName 转换成 cls
        let vc = cls.init()
        vc.title = title
        let nav = WBNavigationController(rootViewController: vc)
        return nav
    }
    
}


