//
//  BaseNavigationController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2018/1/17.
//  Copyright © 2018年 dsjk. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    private let transitionController = NavigationBarTransitionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置全局默认导航栏样式
        transitionController.defaultNavigationBarStyle = CommonNavigationBarStyle.customDefault
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        transitionController.navigationController(navigationController, willShow: viewController, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
