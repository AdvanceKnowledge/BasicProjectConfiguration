//
//  UILabel+Extension.swift
//  MiddleMall
//
//  Created by 无名 on 2019/12/4.
//  Copyright © 2019 无名. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
    class func myLab(text:String,
                      font:CGFloat? = 12.0,
                      textColor:UIColor? = UIColor.black,
                      alignment:NSTextAlignment? = .left,
                      isSystemFont:Bool? = true,
                      numberLine:Int) -> UILabel{
        let lab = UILabel()
        lab.text = text
        lab.textColor = textColor!
        lab.textAlignment = alignment!
        lab.numberOfLines = numberLine
        if (isSystemFont!) {
            lab.font = UIFont.systemFont(ofSize: font!)
        }else{
            lab.font = UIFont.boldSystemFont(ofSize: font!)
        }
        return lab
    }
    
    class func myLab(text:String? = "",
                      font:CGFloat,
                      textColor:UIColor,
                      alignment:NSTextAlignment? = .left,
                      isSystemFont:Bool? = true,
                      numberLine:Int) -> UILabel{
        let lab = UILabel()
        lab.text = text
        lab.textColor = textColor
        lab.textAlignment = alignment!
        lab.numberOfLines = numberLine
        if (isSystemFont!) {
            lab.font = UIFont.systemFont(ofSize: font)
        }else{
            lab.font = UIFont.boldSystemFont(ofSize: font)
        }
        return lab
    }
    
    class func myLab(text:String,
                      font:CGFloat,
                      textColor:UIColor,
                      alignment:NSTextAlignment? = .left,
                      isSystemFont:Bool? = true,
                      numberLine:Int) -> UILabel{
        let lab = UILabel()
        lab.text = text
        lab.textColor = textColor
        lab.textAlignment = alignment!
        lab.numberOfLines = numberLine
        if (isSystemFont!) {
            lab.font = UIFont.systemFont(ofSize: font)
        }else{
            lab.font = UIFont.boldSystemFont(ofSize: font)
        }
        return lab
    }
}
