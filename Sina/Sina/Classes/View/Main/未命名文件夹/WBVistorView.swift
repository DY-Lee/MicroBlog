//
//  WBVistorView.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/20.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBVistorView: UIView {

    //设置访客视图信息
    var infoDict : [String : String]?{
        didSet{
            guard let imageName = infoDict?["imageName"],
                           message = infoDict?["message"] else {
                                return
            }
            tipLabel.text = message
            if imageName == "" {
                return
            }
            houseIconView.image = UIImage(named: imageName)
        }
    }
    
    //小转轮
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var maskIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    //小房子
   private lazy var houseIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
   private lazy var tipLabel:UILabel = UILabel.cz_labelWithText("关注一些人,回这里看看有什么惊喜,关注一些人,回这里看看有什么惊喜",
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
    //这个方法打完上面的会提示
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WBVistorView{
    func setUpUI() {
        backgroundColor = UIColor.cz_colorWithHex(0xEDEDED)
        addSubview(iconView)
        addSubview(maskIconView)
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
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                                                attribute: .Width,
                                                                relatedBy: .Equal,
                                                                toItem: nil,
                                                                attribute: .NotAnAttribute,
                                                                multiplier:0 ,
                                                                constant: 230)) ;
        //(4)注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton,
                                                                        attribute: .Top,
                                                                        relatedBy: .Equal,
                                                                        toItem: tipLabel,
                                                                        attribute: .Bottom,
                                                                        multiplier: 1,
                                                                        constant: 20))
        addConstraint(NSLayoutConstraint(item: registerButton,
                                                                        attribute: .Left,
                                                                        relatedBy: .Equal,
                                                                        toItem: tipLabel,
                                                                        attribute: .Left,
                                                                        multiplier: 1,
                                                                        constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton,
                                                                        attribute: .Width,
                                                                        relatedBy: .Equal,
                                                                        toItem: nil,
                                                                        attribute: .NotAnAttribute,
                                                                        multiplier: 1,
                                                                        constant: 100))
        //(4)登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton,
                                                                        attribute: .Top,
                                                                        relatedBy: .Equal,
                                                                        toItem: tipLabel,
                                                                        attribute: .Bottom,
                                                                        multiplier: 1,
                                                                        constant: 20))
        addConstraint(NSLayoutConstraint(item: loginButton,
                                                                    attribute: .Right,
                                                                    relatedBy: .Equal,
                                                                    toItem: tipLabel,
                                                                    attribute: .Right,
                                                                    multiplier: 1,
                                                                    constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton,
                                                                    attribute: .Width,
                                                                    relatedBy: .Equal,
                                                                    toItem: nil,
                                                                    attribute: .NotAnAttribute,
                                                                    multiplier: 1,
                                                                    constant: 100))
        //背景:VFL
        //views:定义 VFL控件名称和实际名称的映射关系
        //metrics:定义VFL中（）指定的常数映射关系
        let viewDict = ["maskIconView":maskIconView,
                                "registerButton":registerButton]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[maskIconView]-0-|",
                                                                                                                options: [],
                                                                                                                metrics: nil,
                                                                                                                views: viewDict))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                                                                                    "V:|-0-[maskIconView]-(-35)-[registerButton]",
                                                                                                options: [],
                                                                                                metrics: nil,
                                                                                                views: viewDict))
        //用metrics效果同上
//        let metirc = ["spacing":-35]
//        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[maskIconView]-(spacing)-[registerButton]", options: [], metrics: metirc, views: viewDict))
    }
}
