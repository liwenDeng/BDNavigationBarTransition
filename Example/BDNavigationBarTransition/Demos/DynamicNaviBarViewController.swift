//
//  DynamicNaviBarViewController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/2.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

class DynamicNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    lazy var navigationBarStyle: NavigationBarStyleProtocol = {
        let styles = [
            CommonNavigationBarStyle.black,
            CommonNavigationBarStyle.red,
            CommonNavigationBarStyle.none,
            CommonNavigationBarStyle.redWithNoBackTitle,
            CommonNavigationBarStyle.blackWithNoBackTitle,
            CommonNavigationBarStyle.none,
            CommonNavigationBarStyle.gradient,
            CommonNavigationBarStyle.largeTitleBar,
            CommonNavigationBarStyle.scrollable
        ]
        let index = Int(arc4random()) % styles.count
        return styles[index]
    }()
}
