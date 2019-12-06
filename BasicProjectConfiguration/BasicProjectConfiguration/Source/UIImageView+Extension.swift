//
//  UIImage+Extension.swift
//  MiddleMall
//
//  Created by 无名 on 2019/12/4.
//  Copyright © 2019 无名. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    
    /// 图片放大
    func showImage() -> Void {
        let image = self.image
        let window = UIApplication.shared.keyWindow
        let backgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (window?.frame.size.width)!, height: (window?.frame.size.height)!))
        
        backgroundView.backgroundColor = UIColor.init(white: 0.441, alpha: 1.00)
        backgroundView.alpha = 0.0
        
        let imageView = UIImageView.init(frame: self.convert(self.bounds, to: window))
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.tag = 1
        backgroundView.addSubview(imageView)
        window?.addSubview(backgroundView)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.hideImage(tap:)))
        backgroundView.addGestureRecognizer(tap)
        
        UIView.animate(withDuration: 0.3, animations: {
            imageView.center = backgroundView.center
            backgroundView.alpha = 1
        }) { (finished) in
        }
    }
    
    /// 隐藏图片
    /// - Parameter tap: 单击
    @objc func hideImage(tap:UITapGestureRecognizer) -> Void {
        let backgroundView = tap.view
        let imageView = backgroundView?.viewWithTag(1) as! UIImageView
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 0.3, animations: {
            imageView.frame = self.convert(self.bounds, to: window)
            backgroundView?.alpha = 0
        }) { (finished) in
            backgroundView?.removeFromSuperview()
        }
    }
}
