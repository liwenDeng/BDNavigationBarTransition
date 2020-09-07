//
//  DemoTabBarViewController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/2.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit

class DemoTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildViewController(LargeTitleBarViewController(), title: "大标题")
        addChildViewController(RedNaviBarViewController(), title: "红色")
        addChildViewController(BlackNaviBarViewController(), title: "黑色")
        addChildViewController(NoNaviBarViewController(), title: "无导航栏")
    }
    
    func addChildViewController(_ childController: UIViewController, title: String) {
        let tabBarItem: UITabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        childController.tabBarItem = tabBarItem
        childController.title = title
        let navi = BaseNavigationController(rootViewController: childController)
        addChildViewController(navi)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
}
