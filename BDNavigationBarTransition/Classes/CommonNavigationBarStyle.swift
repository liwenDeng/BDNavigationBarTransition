//
//  CustomDefine.swift
//  NavigationDemo
//
//  Created by dengliwen on 2018/1/17.
//  Copyright © 2018年 dsjk. All rights reserved.
//

import UIKit

open class CommonNavigationBarStyle: NavigationBarStyleProtocol {
    
    open var barStyle: UIBarStyle = .default
    open var isTranslucent = true
    open var isBarHidden = false
    open var tintColor: UIColor = .black
    open var titleColor: UIColor?
    open var alpha: CGFloat = 1
    
    /// 导航栏背景色
    open var barBackgroundColor: UIColor?
    /// 导航栏背景渐变色
    open var barGradientBackgroundColors: [UIColor]?
    /// 导航栏文字样式
    open var titleTextAttributes: [NSAttributedString.Key : Any]?
    /// 是否使用大标题
    open var prefersLargeTitles = false
    open var largeTitleTextAttributes: [NSAttributedString.Key : Any]?
    /// 返回按钮
    open var backIndicatorImage: UIImage?
    open var backIndicatorTransitionMaskImage: UIImage?
    /// 导航栏背景图
    open var barBackgroundImage: UIImage?
    /// 分割线
    open var shadowImage: UIImage?
    /// 是否隐藏返回按钮文字
    open var hideBackTitle: Bool = false
    
    public init() {
    }
    
    public static var defaultStyle: CommonNavigationBarStyle {
        return CommonNavigationBarStyle()
    }
    
    open func refresh(_ navigationBar: UINavigationBar?, from fromViewController: UIViewController?, to toViewController: UIViewController?) {
        guard let navigationBar = navigationBar else {
            return
        }
        navigationBar.isHidden = isBarHidden
        navigationBar.barStyle = barStyle
        navigationBar.isTranslucent = isTranslucent
        navigationBar.alpha = alpha
        navigationBar.shadowImage = shadowImage
        navigationBar.tintColor = tintColor
        navigationBar.shadowImage = shadowImage
        
        //导航栏颜色
        navigationBar.barTintColor = barBackgroundColor
        navigationBar.bd_setGradientBackground(colors: barGradientBackgroundColors)
        if let barBackgroundImage = barBackgroundImage {
            navigationBar.setBackgroundImage(barBackgroundImage, for: .default)
        }
        
        // 返回按钮
        navigationBar.backIndicatorImage = backIndicatorImage
        navigationBar.backIndicatorTransitionMaskImage = backIndicatorTransitionMaskImage
        
        // 标题文字样式
        let defaultTitleTextAttributes = [NSAttributedStringKey.foregroundColor: titleColor ?? tintColor]
        navigationBar.titleTextAttributes = titleTextAttributes ?? defaultTitleTextAttributes
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = prefersLargeTitles
            navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        } else {
            // Fallback on earlier versions
        }
        
        // 是否显示返回按钮文字，需要设置fromViewController.navigationItem
        if hideBackTitle {
            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
            fromViewController?.navigationItem.backBarButtonItem = backButton
        } else {
            fromViewController?.navigationItem.backBarButtonItem = nil
        }
    }
}
