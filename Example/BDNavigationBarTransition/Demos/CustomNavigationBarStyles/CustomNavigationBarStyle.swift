//
//  CustomNavigationBarStyle.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/4.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

extension CommonNavigationBarStyle {
    
    static var customDefault: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .black
        style.tintColor = .white
        return style
    }
    
    static var red: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .red
        style.tintColor = .white
        return style
    }
    
    static var redWithNoBackTitle: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .red
        style.tintColor = .white
        style.hideBackTitle = true
        return style
    }
    
    static var black: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .black
        style.tintColor = .white
        return style
    }
    
    static var blackWithNoBackTitle: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .black
        style.tintColor = .white
        style.hideBackTitle = true
        style.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray ,
                                     NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22)]
        return style
    }
    
    static var none: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.isBarHidden = true
        return style
    }
    
    static var gradient: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.tintColor = .white
        style.barGradientBackgroundColors = [.red, .green]
        return style
    }
    
    static var scrollable: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundColor = .orange
        style.alpha = 0
        style.tintColor = .white
        style.isTranslucent = false
        return style
    }
    
    static var largeTitleBar: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.prefersLargeTitles = true
        style.barBackgroundColor = .orange
        return style
    }
    
    static var transparentBar: CommonNavigationBarStyle {
        let style = CommonNavigationBarStyle()
        style.barBackgroundImage = UIImage()
        style.shadowImage = UIImage()
        return style
    }
}
