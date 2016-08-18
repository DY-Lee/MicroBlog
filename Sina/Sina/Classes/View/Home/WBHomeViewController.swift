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

        // Do any additional setup after loading the view.
    }
     @objc private func showFriends() {
        navigationController?.pushViewController(WBHomeTextViewController(), animated: true)
    }
}
extension WBHomeViewController {
    override func setUpUI() {
        super.setUpUI()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .Plain, target: self, action: #selector(showFriends))
    }
}