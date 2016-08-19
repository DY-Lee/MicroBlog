//
//  WBDemoViewController.swift
//  传智微博
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " 第\(navigationController?.childViewControllers.count ?? 0)个"
    }
    func showNext()  {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension WBDemoViewController{
    
    override func setUpUI() {
        navitem.rightBarButtonItem = UIBarButtonItem(title: "next",target: self, action: #selector(showNext))
        super.setUpUI()

    }
}