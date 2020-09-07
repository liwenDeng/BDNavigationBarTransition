//
//  DemoViewControllers.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/4.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

/// 默认导航栏样式
class DefaultNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.defaultStyle
}

/// 红色导航栏
class RedNaviBarViewController: BaseDemoViewController {

}
// 通过扩展方式自定义导航栏样式
extension RedNaviBarViewController: CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol {
        return CommonNavigationBarStyle.red
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

/// 红色无返回文字
class RedNoBackTitleNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.redWithNoBackTitle
}

/// 黑色样式
class BlackNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.black
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

/// 黑色无返回文字
class BlackNoBackTitleNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle:NavigationBarStyleProtocol = CommonNavigationBarStyle.blackWithNoBackTitle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

/// 隐藏导航栏
class NoNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.none
}

/// 渐变色导航栏
class GradientNaviBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.gradient
}

/// 透明背景色导航栏
class TransparentBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.transparentBar
}

/// 大标题
class LargeTitleBarViewController: BaseDemoViewController, CustomNavigationBar {
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.largeTitleBar
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

