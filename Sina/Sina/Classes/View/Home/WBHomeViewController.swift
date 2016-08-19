//
//  WBHomeViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
     @objc private func showFriends() {
        let vc = WBDemoViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension WBHomeViewController {
    override func setUpUI() {
        super.setUpUI()
        //系统方法高亮无法显示该效果
        navitem.leftBarButtonItem = UIBarButtonItem(title:"好友",target:self,action:#selector(showFriends)) ;
    }
}