//
//  ScrollImageNavigationBarStyle.swift
//  BDNavigationBarTransition_Example
//
//  Created by dengliwen on 2020/9/7.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import BDNavigationBarTransition

class ScrollImageNavigationBarStyle: CommonNavigationBarStyle {
    init(_ color: UIColor, progress: CGFloat) {
        super.init()
        self.shadowImage = UIImage()
        self.tintColor = UIColor.black
        self.barBackgroundImage = UIImage.imageWithColor(color.withAlphaComponent(progress))
    }
}
