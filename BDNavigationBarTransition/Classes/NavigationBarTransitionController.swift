//
//  NavigationBarTransitionController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/2.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit

open class NavigationBarTransitionController {
    /// 默认导航栏样式
    open var defaultNavigationBarStyle: NavigationBarStyleProtocol?
    
    public init() {
    }
    
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinate = navigationController.transitionCoordinator {
            let fromVC = coordinate.viewController(forKey: .from)
            if #available(iOS 10.0, *) {
                coordinate.notifyWhenInteractionChanges({ [weak self] (context) in
                    self?.dealInteractionChanges(navigationController, context: context)
                })
            } else {
                // Fallback on earlier versions
                coordinate.notifyWhenInteractionEnds({[weak self] (context) in
                    self?.dealInteractionChanges(navigationController, context: context)
                })
            }
            transition(navigationController, from: fromVC, to: viewController)
        } else {
            transition(navigationController, from: nil, to: viewController)
        }
    }
    
    /// 处理返回手势中断的情况
    private func dealInteractionChanges(_ navigationController: UINavigationController?, context:UIViewControllerTransitionCoordinatorContext) {
        if context.isCancelled {
            // 手势交互取消，交换fromVC与toVC
            let toVC = context.viewController(forKey: .to)
            let fromVC = context.viewController(forKey: .from)
            transition(navigationController, from: toVC, to: fromVC)
        }
    }
    
    private func transition(_ navigationController: UINavigationController?, from fromViewController: UIViewController?, to toViewController: UIViewController?) {
        let navigationBar = navigationController?.navigationBar
        let barStyle = (toViewController as? CustomNavigationBar)?.navigationBarStyle ?? defaultNavigationBarStyle
        if let barStyle = barStyle,
           let navigationBar = navigationBar {
            barStyle.refresh(navigationBar, from: fromViewController, to: toViewController)
        }
    }
}
