//
//  WBHomeViewController.swift
//  Sina
//
//  Created by Macintosh HD on 16/8/17.
//  Copyright © 2016年 lidingyuan. All rights reserved.
//

import UIKit

private let cellId = "cellId"
class WBHomeViewController: WBBaseViewController {

    private lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //加载数据
    override func loadData() {
        //模拟延时加载数据
        dispatch_after(DISPATCH_TIME_NOW + 1, dispatch_get_main_queue()) {
            for i in 0..<16 {
                if self.isPullUp{
                    //加载数据到底部
                    self.statusList.append("上拉\(i)")
                }else{
                    //倒序
                    self.statusList .insert(i.description, atIndex: 0)
                }
            }
            self.isPullUp = false
            print("刷新表格")
            //结束刷新控件
            self.reflashControl?.endRefreshing()
            self.tableView?.reloadData()
        }
        
    }
    
     @objc private func showFriends() {
        let vc = WBDemoViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension WBHomeViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        cell?.textLabel?.text = statusList[indexPath.row]
        
        return cell!
    }
}
extension WBHomeViewController {
    override func setUpUI() {
        super.setUpUI()
        //系统方法高亮无法显示该效果
        navitem.leftBarButtonItem = UIBarButtonItem(title:"好友",target:self,action:#selector(showFriends)) ;
//        automaticallyAdjustsScrollViewInsets = false  //取消自动缩进 － 如果隐藏了导航栏，会缩进20个点
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}