//
//  Command.swift
//  HouseholdService
//
//  Created by 无名 on 2019/1/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
//import SVProgressHUD
class Command: NSObject {
    
    /// 修改导航卡兰
    static func globalStyleModification() -> Void {
//        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
//        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
//        SVProgressHUD.setMinimumDismissTimeInterval(0.35)
//        SVProgressHUD.setDefaultMaskType(.clear)//提示时,用户不可以做其他操作
        
        UINavigationBar.appearance().barTintColor = Const().mainColor
        
        UINavigationBar.appearance().isTranslucent = false;//透明度
        
        let attributes = NSDictionary.init(objects: [UIColor.white,UIFont.boldSystemFont(ofSize: 18)], forKeys: [NSAttributedString.Key.foregroundColor as NSCopying,NSAttributedString.Key.font  as NSCopying])//字体样式
        
        UINavigationBar.appearance().titleTextAttributes = attributes as? [NSAttributedString.Key : Any]
        
        // 隐藏导航栏下面的线
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UITabBar.appearance().barTintColor = UIColor.colorWithString(colorStr: "f3f3f6")
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
}
