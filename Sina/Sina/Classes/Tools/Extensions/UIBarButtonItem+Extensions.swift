//
//  UIBarButtonItem+Extensions.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/19.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    //size默认17
    convenience init(title:String,fontSize:CGFloat = 17,target:AnyObject,action:Selector, isBack:Bool = false) {
        
        let btn:UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGrayColor(), highlightedColor: UIColor.orangeColor())
        if isBack {
            let imgStr = "navigationbar_back_withtext"
            btn.setImage(UIImage(named : imgStr), forState: .Normal)
            btn.setImage(UIImage(named: imgStr + "_highlighted"), forState: .Selected)
        }
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.init(customView:btn)
    }
}