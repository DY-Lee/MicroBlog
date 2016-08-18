//
//  Bundle+Extensions.swift
//  反射机制
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

import Foundation

extension NSBundle {

    // 计算型属性类似于函数，没有参数，有返回值
    // infoDictionary 包含了项目中几乎所有的基本信息，SDK版本，项目名称等。
    //infoDictionary先解包在取值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
