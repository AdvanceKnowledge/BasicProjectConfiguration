//
//  Const.swift
//  LearSwift
//
//  Created by 王延磊 on 2018/11/16.
//  Copyright © 2018 追@寻. All rights reserved.
//

import UIKit
//一个参数的闭包函数
typealias OneParameter_block = (Any?) -> (Void)
typealias TwoParameter_block = (Any?,Any?) -> (Void)
typealias HaveReturnValueParameter_block = (Any?,Any?,Any?) -> Void

class Const: NSObject {
        
    /// 主题背景颜色
    let mainColor = UIColor.RGB(R: 51, G: 204, B: 204, Alp: 1)
    
    /// 屏幕的宽
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    
    /// 屏幕的高
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    /// 屏幕宽比例
    let ProportionW = UIScreen.main.bounds.size.width/375
    
    /// 屏幕高比例
    let ProportionH = UIScreen.main.bounds.size.height/667
    
    /// 获取当前版本号
    let BUNDLE_VERSION = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
    
    /// 获取设备版本的UUID
    let DIV_UUID = UIDevice.current.identifierForVendor?.uuidString
    
    /// 判断是否是iPhoneX
    let kIs_iPhoneX = (UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? __CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size):false
    
    /// iPhoneX顶部安全区域
    let kTopBarSafeHeight = ((UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? (__CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size)||__CGSizeEqualToSize(CGSize.init(width: 414.0, height: 896.0), UIScreen.main.bounds.size)):false) ? 24:0
    
    /// iPhoneX底部安全区域
    let kBottomSafeHeight = ((UIScreen.instanceMethod(for: #selector(getter: UIScreen.currentMode)) != nil) ? (__CGSizeEqualToSize(CGSize.init(width: 375.0, height: 812.0), UIScreen.main.bounds.size)||__CGSizeEqualToSize(CGSize.init(width: 414.0, height: 896.0), UIScreen.main.bounds.size)):false) ? 34:0
    
    /// 本地化导航栏标题
    /// - Parameter name: 标题名称
    /// - Parameter controller: 控制器
    static func navtitle(name:NSString,controller:UIViewController) -> Void {
        controller.navigationItem.title = NSLocalizedString(name as String, comment:"导航栏标题" )
    }
    
    /// 本地化导航栏标题
    /// - Parameter name: 名称
    static func WYLLocalString(name:NSString) -> NSString {
        return NSLocalizedString(name as String, comment:"本地化" ) as NSString
    }
    
    ///字符串不为空
    /// - Parameter obj: 需判断文本
    static func IsYESStrEmpty(obj:String?) -> Bool{
        var result = Bool()
        
        result = obj == nil || 
        (obj?.isEqual(NSNull()))! ||
        (obj?.isEqual(""))! ||
        (obj?.isEqual("null"))!
        return result
    }
    
    /// 字符串为空
    /// - Parameter obj: 需判断文本
    static func IsNotStrEmpty( obj:String?) -> Bool{
        let result = !(obj == nil) &&
            !(obj?.isEqual(NSNull()))! &&
            !(obj?.isEqual(""))! &&
            !(obj?.isEqual("null"))!
        
        return result
    }
    
    /// 设置行间距
    /// - Parameter normalString: 需要设置行间距的文本
    /// - Parameter font: 字体大小
    /// - Parameter linspace: 期望行间距大小
    static func getAttributedStringWithNormalString(normalString:NSString,
                                                    font:CGFloat,
                                                    linspace:CGFloat) -> NSAttributedString {
        if normalString == "" {
            return NSAttributedString.init(string: "", attributes: [:])
        }
        let attributeDict = NSMutableDictionary.init(capacity: 3)
        attributeDict.setValue(UIFont.systemFont(ofSize: font),
                               forKey: NSAttributedString.Key.font.rawValue)
        let paraStyle = NSMutableParagraphStyle.init()
        paraStyle.lineSpacing = linspace
        
        attributeDict.setValue(paraStyle, forKey: NSAttributedString.Key.paragraphStyle.rawValue)
        return NSAttributedString.init(string: normalString as String,
                                       attributes: attributeDict as? [NSAttributedString.Key : Any])
    }
    
    /// 颜色生成图片
    /// - Parameter color: 颜色
    /// - Parameter size: 生成的图片大小
    static func colorToImage(color:UIColor,size:CGSize) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //创建图片
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()//创建图片上下文
        context?.setFillColor(color.cgColor)//设置当前填充颜色的图形上下文
        context?.fill(rect)//填充颜色
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }
}

