//
//  UIColor+Extension.swift
//  MiddleMall
//
//  Created by 无名 on 2019/12/4.
//  Copyright © 2019 无名. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    
    public static func RGB(R:Float,G:Float,B:Float,Alp:Float) -> UIColor {
        
        return UIColor.init(red: CGFloat(R/255.0), green: CGFloat(G/255.0), blue: CGFloat(B/255.0), alpha: CGFloat(Alp));
    }
    
    public static func colorWithString(colorStr:NSString) -> UIColor{
        var cString = colorStr.trimmingCharacters(in: CharacterSet.ReferenceType.whitespacesAndNewlines) as String
        if (cString.count < 6) {
            return UIColor.clear
        }
        if cString.hasPrefix("0X") {
            cString  = String(cString[cString.index(cString.startIndex, offsetBy: 2)...])
        }
        if cString.hasPrefix("#") {
            cString  = String(cString[cString.index(cString.startIndex, offsetBy: 1)...])
        }
        
        if (cString.count != 6) {
            return UIColor.clear
        }
        let rstr = cString.mySubstring(start: 0, length: 2)
        let gstr = cString.mySubstring(start: 2, length: 2)
        let bstr = cString.mySubstring(start: 4, length: 2)
        
        var R = CUnsignedInt(),G = CUnsignedInt(),B = CUnsignedInt()
        Scanner.init(string: rstr).scanHexInt32(&R)
        Scanner.init(string: gstr).scanHexInt32(&G)
        Scanner.init(string: bstr).scanHexInt32(&B)
        return UIColor.init(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha: CGFloat(1));
    }
    
}
