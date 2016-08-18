//
//  WBBaseViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension WBBaseViewController{
    func setUpUI() {
        view.backgroundColor = UIColor.cz_randomColor()
    }
}
