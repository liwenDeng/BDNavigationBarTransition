//
//  ScrollHeaderImageBarViewController.swift
//  BDNavigationBarTransition_Example
//
//  Created by dengliwen on 2020/9/7.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import BDNavigationBarTransition

class ScrollHeaderImageBarViewController: BaseDemoViewController, CustomNavigationBar {

    var navigationBarStyle: NavigationBarStyleProtocol = ScrollImageNavigationBarStyle(.orange, progress: 0)

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
            self.navigationBarStyle = ScrollImageNavigationBarStyle(.white, progress: 0)
            self.navigationBarStyle.refresh(navigationController?.navigationBar, from: nil, to: nil)
        } else {
            let minAlphaOffset: CGFloat = 0.0
            let maxAlphaOffset: CGFloat = 200.0
            let alpha = (scrollView.contentOffset.y - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset)
            self.navigationBarStyle = ScrollImageNavigationBarStyle(.white, progress: alpha)
            self.navigationBarStyle.refresh(navigationController?.navigationBar, from: nil, to: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}


