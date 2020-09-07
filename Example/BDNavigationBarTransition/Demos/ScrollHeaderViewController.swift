//
//  ScrollHeaderViewController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/3.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

class ScrollHeaderViewController: BaseDemoViewController, CustomNavigationBar {
    
    var navigationBarStyle: NavigationBarStyleProtocol = CommonNavigationBarStyle.scrollable

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        headerView.backgroundColor = .red
        tableView.tableHeaderView = headerView
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            (navigationBarStyle as! CommonNavigationBarStyle).alpha = 0
            navigationBarStyle.refresh(navigationController?.navigationBar, from: nil, to: nil)
        } else {
            let minAlphaOffset: CGFloat = 0.0
            let maxAlphaOffset: CGFloat = 100.0
            let alpha = (scrollView.contentOffset.y - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset)
            (navigationBarStyle as! CommonNavigationBarStyle).alpha = alpha
            navigationBarStyle.refresh(navigationController?.navigationBar, from: nil, to: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}
