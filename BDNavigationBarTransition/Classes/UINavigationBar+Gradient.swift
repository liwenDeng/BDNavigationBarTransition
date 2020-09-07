//
//  UINavigationBar+Extension.swift
//  NavigationDemo
//
//  Created by dengliwen on 2018/1/17.
//  Copyright © 2018年 dsjk. All rights reserved.
//

import UIKit

extension UINavigationBar {
    /// 设置导航栏渐变色背景
    func bd_setGradientBackground(colors: [UIColor]?) {
        if let gradientColors = colors {
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            var updatedFrame = bounds
            updatedFrame.size.height += statusBarHeight
            let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: gradientColors)
            setBackgroundImage(gradientLayer.creatGradientImage(), for: .default)
        } else {
            setBackgroundImage(nil, for: .default)
        }
    }
}

// MARK: - 渐变色
extension CAGradientLayer {
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 1, y: 0)
    }
    
    func creatGradientImage() -> UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
