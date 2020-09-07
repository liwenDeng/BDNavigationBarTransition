//
//  ViewControllerCustomNaviBar.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/2.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit

/// 自定义导航栏样式协议
public protocol CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol { get }
}

public protocol NavigationBarStyleProtocol {
    func refresh(_ navigationBar: UINavigationBar?, from fromViewController: UIViewController?, to toViewController: UIViewController?)
}
