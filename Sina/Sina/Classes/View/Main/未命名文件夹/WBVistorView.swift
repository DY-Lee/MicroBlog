//
//  WBVistorView.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/20.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBVistorView: UIView {

    //小转轮
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //小房子
   private lazy var houseIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
   private lazy var tipLabel:UILabel = UILabel.cz_labelWithText("关注一些人,回这里看看有什么惊喜",
                                                                fontSize: 14,
                                                                color: UIColor.darkGrayColor())
    //注册按钮
    private lazy var registerButton:UIButton = UIButton.cz_textButton("注册",
                                                                      fontSize: 14,
                                                                      normalColor: UIColor.orangeColor(),
                                                                      highlightedColor: UIColor.blackColor(),
                                                                      backgroundImageName: "common_button_white_disable")
    //登陆按钮
    private lazy var loginButton:UIButton = UIButton.cz_textButton("登录",
                                                                   fontSize: 14,
                                                                   normalColor: UIColor.darkGrayColor(),
                                                                   highlightedColor: UIColor.blackColor(),
                                                                   backgroundImageName: "common_button_white_disable")

    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WBVistorView{
    func setUpUI() {
        backgroundColor = UIColor.whiteColor()
        addSubview(iconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //纯代码自动布局(苹果原生的两个方法：构造函数，VFL可视化格式语言)
        //1、取消autoresizing(xib时autolayout)
        for sview in subviews {
            sview.translatesAutoresizingMaskIntoConstraints = false
        }
        //2、自动布局
        //(1) iconView.CenterX ＝self.CenterX * 1.0 + 0
        addConstraint(NSLayoutConstraint(item: iconView,
                                                                    attribute: .CenterX,
                                                                    relatedBy: .Equal,
                                                                    toItem: self,
                                                                    attribute: .CenterX,
                                                                    multiplier: 1.0,
                                                                    constant: 0))
        
        addConstraint(NSLayoutConstraint(item: iconView,
                                                                        attribute: .CenterY,
                                                                        relatedBy: .Equal,
                                                                        toItem: self,
                                                                        attribute: .CenterY,
                                                                        multiplier: 1.0,
                                                                        constant: -60))
        
        
        //(2)houseView
        addConstraint(NSLayoutConstraint(item: houseIconView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: iconView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0))
        
        addConstraint(NSLayoutConstraint(item: houseIconView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: iconView,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0))
        //(3)提示标签
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                                                    attribute: .CenterX,
                                                                    relatedBy: .Equal,
                                                                    toItem: iconView,
                                                                    attribute: .CenterX,
                                                                    multiplier: 1.0,
                                                                    constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                                                        attribute: .Top,
                                                                        relatedBy: .Equal,
                                                                        toItem: iconView,
                                                                        attribute: .Bottom,
                                                                        multiplier: 1.0,
                                                                        constant: 20))
    }
}
