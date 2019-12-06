//
//  MyButton.swift
//  MiddleMall
//
//  Created by 无名 on 2019/10/31.
//  Copyright © 2019 无名. All rights reserved.
//

import UIKit
typealias OneParameter_block2 = (MyButton?) -> (Void)

class MyButton: UIButton {
    var block: OneParameter_block2!
}
extension MyButton{
    
    /// 创建button
    /// - Parameter title: 默认 标题
    /// - Parameter selectTitle: 选中状态下 标题
    /// - Parameter normalImage: 正常状态下 图片
    /// - Parameter selectImage: 选中状态下 图片
    /// - Parameter textFontSize: 文本 大小
    /// - Parameter buttonAction: 点击回调
    convenience init(title:String?,
                     selectTitle:String? = nil,
                     normalImage:UIImage? = nil,
                     selectImage:UIImage? = nil,
                     textFontSize:CGFloat? = 24.0,
                     buttonAction:@escaping OneParameter_block2){
        self.init()
        setTitle(title ?? "", for: .normal)
        if (selectTitle != nil) {
            setTitle(selectTitle!, for: .selected)
        }
        block = buttonAction
        if (normalImage != nil) {
            setBackgroundImage(normalImage, for: .normal)
        }
        if (selectImage != nil) {
            setBackgroundImage(selectImage, for: .selected)
        }
        titleLabel?.font = UIFont.systemFont(ofSize: textFontSize!)
        addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
    }
    
    /// 点击事件
    /// - Parameter btn: 被点击的btn
    @objc func btnAction(btn:MyButton) {
        if (block != nil) {
            block(self)
        }
    }
}
