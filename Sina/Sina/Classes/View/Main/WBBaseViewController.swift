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
    //登陆状态的标记
    var isLogon = false
    //自定义导航条
    var reflashControl :UIRefreshControl?
    //区分上拉，下拉
    var isPullUp = false
    
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
        reflashControl?.endRefreshing()
    }
}
extension WBBaseViewController{
    func setUpUI() {
        view.backgroundColor = UIColor.whiteColor()
        setUpNavigationBar()
        isLogon ? setUpTableView() : setUpVisitorView()
    }
    //未登陆界面
    private func setUpVisitorView(){
        let visitorView = WBVistorView(frame: view.frame)
        view.insertSubview(visitorView, belowSubview: navigationBar)
    }
    func setUpTableView(){
        tableView = UITableView(frame: CGRectMake(0, 64, view.frame.size.width, view.frame.size.height), style: .Plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.contentInset = UIEdgeInsets(top: 0,
                                                                               left: 0,
                                                                               bottom: (tabBarController?.tabBar.frame.size.height)! + 64,
                                                                               right: 0)
        view.addSubview(tableView!)

        //刷新控件
        reflashControl = UIRefreshControl()
        reflashControl?.addTarget(self, action: #selector(loadData), forControlEvents: .ValueChanged)
        tableView?.addSubview(reflashControl!)
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
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //在展示最大的section的最后一行,且没有下拉的时候   自动执行下拉刷新
        let sec = tableView.numberOfSections - 1    //section的数量
        let rowCount = tableView.numberOfRowsInSection(sec) - 1
        
        if sec < 0 || indexPath.row < 0 {
            return
        }
        if indexPath.section == sec && indexPath.row == rowCount && !isPullUp  {
            isPullUp = true
            self.loadData()
        }
    }
}
