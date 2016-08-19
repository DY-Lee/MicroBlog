//
//  WBBaseViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRectMake(0,0,UIScreen.cz_screenWidth(),64))
    //自定义
    lazy var navitem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navitem.title = title
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}
extension WBBaseViewController{
    func setUpUI() {
        view.backgroundColor = UIColor.cz_randomColor()
        //添加导航条
        view.addSubview(navigationBar)
        navigationBar.items = [navitem]
        navigationBar.barTintColor = UIColor.cz_colorWithHex(0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGrayColor()] ;
    }
}
