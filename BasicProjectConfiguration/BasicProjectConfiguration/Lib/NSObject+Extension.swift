//
//  NSObject+Extension.swift
//  MiddleMall
//
//  Created by 无名 on 2019/12/4.
//  Copyright © 2019 无名. All rights reserved.
//

import Foundation
extension NSObject{
    //获取日期人选type YYYY-MM-DD
    func getDateWith(type:NSString) -> NSString {
        let currentDate = NSDate()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = type as String
        let dateString = dateFormatter.string(from: currentDate as Date)
        return dateString as NSString
    }
}
