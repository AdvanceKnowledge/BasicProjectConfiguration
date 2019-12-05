//
//  String+Extension.swift
//  MiddleMall
//
//  Created by 无名 on 2019/12/4.
//  Copyright © 2019 无名. All rights reserved.
//

import Foundation
import UIKit
// MARK: -Get
precedencegroup MatchPrecedence{
    associativity:none
    higherThan:DefaultPrecedence
}
infix operator =~:MatchPrecedence
struct RegexHelper {
    let regex:NSRegularExpression
    init(_ pattern:String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func math(_ input:String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        return matches.count > 0
        
    }
}

// MARK: -验证字符串格式 =~   电话、邮箱、纯数字、身份证号、网址链接
extension String{
    enum StringType:Int{
        /// 电话号码
        case Tel = 0,
        
        /// 邮箱
        Email,
        
        /// 纯数字
        PureDigital,
        
        /// 身份证号码
        IdCard,
        
        /// 连接
        URL
    }
    
    /// 判断字符串类型
    /// - Parameter lhs: 判断内容
    /// - Parameter type: 目标类型
    static func =~(lhs:String,type:StringType) -> Bool {
        var rhs:String?
        switch type{
        case .Email:
            rhs = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            break
        case .Tel:
            /**
             * 手机号码:
             * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
             * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
             * 联通号段: 130,131,132,155,156,185,186,145,176,1709
             * 电信号段: 133,153,180,181,189,177,1700
             */
            let rhs1 = "^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$"
            let rhs2 = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
            let rhs3 = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
            let rhs4 = "^(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
            let result1: Bool = String.judgmentCalls(rhs: rhs1, lhs: lhs)
            let result2: Bool = String.judgmentCalls(rhs: rhs2, lhs: lhs)
            let result3: Bool = String.judgmentCalls(rhs: rhs3, lhs: lhs)
            let result4: Bool = String.judgmentCalls(rhs: rhs4, lhs: lhs)
            if (result1 || result2 || result3 || result4){
                return true
            }else{
                return false
            }
        case .PureDigital:
            let content = lhs.trimmingCharacters(in: NSCharacterSet.decimalDigits)
            if (content.count > 0){
                return false
            }else{
                return true
            }
            
        case .IdCard:
            rhs = "^(\\d{14}|\\d{17})(\\d|[xX])$"
            break
        case .URL:
            rhs = "[a-zA-z]+://[^\\s]*"
            break
        }
        
        return String.judgmentCalls(rhs: rhs!, lhs: lhs)
        
    }
    
    static func judgmentCalls(rhs:String,lhs:String) -> Bool {
        do{
            return try RegexHelper(rhs).math(lhs)
        }catch _{
            return false
        }
    }
    
    /// 截取  开始到定位置
    /// - Parameter index: 截取终点
    func mySubstring(to index:NSInteger) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    
    
    /// 截取  指定位置到末尾
    /// - Parameter index: 截取起点
    func mySubstring(from index:NSInteger) -> String{
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
    
    /// 指定位置向后截取指定长度
    /// - Parameter location: 起点
    /// - Parameter long: 长度
    func mySubstring(start location:NSInteger, length long:NSInteger) -> String {
        var len = long
        if len == -1 {
            len = self.count - location
        }
        let st = self.index(startIndex, offsetBy:location)
        let en = self.index(st, offsetBy:len)
        
        return String(self[st ..< en])
    }
    
    /// 指定字符之前的文本
    /// - Parameter str: 指定字符
    /// - Parameter include: true 包含指定字符 false 不包含指定字符
    func mySubstring(before str:Character,includeOrNot include:Bool) -> String {
        if !self.contains(str) {
            return self
        }
        
        if include {
            return String(self[...(self.firstIndex(of: str) ?? self.endIndex)])
        }
        return String(self[..<(self.firstIndex(of: str) ?? self.endIndex)])
    }
   
   /// 指定字符之后的文本
    /// - Parameter str: 指定字符
    /// - Parameter include: true 包含指定字符 false 不包含指定字符
    func mySubstring(after str:Character,includeOrNot include:Bool) -> String {
        if !self.contains(str) {
            return self
        }
        if include {
            let st = self.index((self.firstIndex(of: str) ?? self.endIndex), offsetBy: 0)
            return String(self[st..<self.endIndex])
        }
        
        let st = self.index((self.firstIndex(of: str) ?? self.endIndex), offsetBy: 1)
        return String(self[st..<self.endIndex])
    }
    
    /// 获取文本宽度
    /// - Parameter fontSize: 文字大小
    /// - Parameter height: 控件高度
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
}
