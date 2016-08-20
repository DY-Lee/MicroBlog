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
    override func loadData() {
        for i in 0..<10 {
            //倒序
            statusList .insert(i.description, atIndex: 0)
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
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}