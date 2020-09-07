//
//  Utils.swift
//  BDNavigationBarTransition_Example
//
//  Created by dengliwen on 2020/9/7.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension UIImage {
    static func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
