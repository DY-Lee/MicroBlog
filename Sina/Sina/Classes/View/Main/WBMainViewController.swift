//
//  WBMainViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {
    
    private lazy var composeButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        setUpComposeButton()
    }
    //Portrait  竖屏
    //Landscape 横屏
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    //点击事件
    //private 保证方法私有，仅在当前对象访问
    //@objc 允许这个函数在运行时 通过 oc的消息机制被调用 ,如果不加上的话，会报错
     @objc private func editBlogAction(){
        print("dddd")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension WBMainViewController {
    private func setUpComposeButton(){
        tabBar.addSubview(composeButton)
        //计算按钮的宽度
        let count:CGFloat = CGFloat(childViewControllers.count) //类型转换
        let w:CGFloat = view.frame.size.width / count - 1 //减1为了覆盖容错点
//        composeButton.frame = CGRectMake(<#T##x: CGFloat##CGFloat#>, <#T##y: CGFloat##CGFloat#>, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
        //正数向内缩进，负数向外拓展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)       //将button放在中间
        composeButton.addTarget(self, action: #selector(WBMainViewController.editBlogAction), forControlEvents: .TouchUpInside)
    }
    //创建一个数组存放5个控制器的信息
    private func setupChildControllers() {
        let array = [["clsName":"WBHomeViewController"
                        ,"title":"首页" ,
                    "imageName":"home",
            "visitorInfoDic":["imageName":"","message":"关注一些人,回这里看看有什么惊喜,关注一些人,回这里看看有什么惊喜"]
            ],
                     ["clsName":"WBMessageViewController" ,
                        "title":"消息" ,
                        "imageName":"message_center",
                        "visitorInfoDic":["imageName":"visitordiscover_image_message","message":"登录后,别人评论你的微博,发给你的消息,都会在这里收到通知"]
            ],
                     ["clsName":"UIViewController"],//中间为了放置＋
            
                     ["clsName":"WBDiscoverViewController" ,
                        "title":"发现" ,
                        "imageName":"discover",
                        "visitorInfoDic":["imageName":"visitordiscover_image_message","message":"登录后,最新、最热的微博尽在掌握,不会再与实事潮流擦肩而过"]
            ],
                     ["clsName":"WBProfileViewController" ,
                        "title":"我" ,
                        "imageName":"profile",
                        "visitorInfoDic":["imageName":"visitordiscover_image_profile","message":"登录后,你的微博、相册、个人资料都会显示在这里,展示给别人"]
        ]]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict as! [String : AnyObject]))
        }
        viewControllers = arrayM
    }
    
    //取得字典内容
    private func controller(dict: [String :AnyObject])->UIViewController{
        //取得字典内容
        guard let clsName = dict["clsName"] as? String ,
                    title = dict["title"] as? String ,
                    imageName = dict["imageName"] as? String ,
                    visitorInfoDict = dict["visitorInfoDic"],
                    cls = NSClassFromString(NSBundle.mainBundle().namespace + "." + clsName) as? WBBaseViewController.Type
            else {
                return UIViewController()
        }
    //创建视图控制器
//        创建视图控制器
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_"+imageName)
        vc.visitorInfoDic = visitorInfoDict as? [String : String]
        vc.tabBarItem.selectedImage = UIImage(named:  "tabbar_"+imageName+"_highlighted")?.imageWithRenderingMode(.AlwaysOriginal)
        //设置 tabbar 颜色、字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName:UIColor.orangeColor()],
            forState: .Selected)
        
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName:UIFont.systemFontOfSize(13)],
            forState: .Normal)
        
        let nav = WBNavigationController(rootViewController: vc)
        return nav
    }
    //着色（Tint Color）是iOS7界面中的一个.设置UIImage的渲染模式：UIImage.renderingMode重大改变，你可以设置一个UIImage在渲染时是否使用当前视图的Tint Color。UIImage新增了一个只读属性：renderingMode，对应的还有一个新增方法：imageWithRenderingMode:，它使用UIImageRenderingMode枚举值来设置图片的renderingMode属性。该枚举中包含下列值：
//    UIImageRenderingModeAutomatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
//    UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
//    UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
}


