//
//  WBBaseViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    var tableView : UITableView?
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRectMake(0,0,UIScreen.cz_screenWidth(),64))
    
    lazy var navitem = UINavigationItem()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    override var title: String?{
        didSet {
            navitem.title = title
        }
    }
    //子类实现方法
    func loadData(){
        
    }

}
extension WBBaseViewController{
    func setUpUI() {
        view.backgroundColor = UIColor.cz_randomColor()
        setUpNavigationBar()
        setUpTableView()
    }
    func setUpTableView(){
        tableView = UITableView(frame: CGRectMake(0, 64, view.frame.size.width, view.frame.size.height), style: .Plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        view.addSubview(tableView!)
    }
    //添加导航条
    func setUpNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navitem]
        navigationBar.barTintColor = UIColor.cz_colorWithHex(0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGrayColor()] ;
    }
}
extension WBBaseViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
