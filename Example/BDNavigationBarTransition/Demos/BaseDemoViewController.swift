//
//  BaseDemoViewController.swift
//  NavigationDemo
//
//  Created by dengliwen on 2020/9/2.
//  Copyright © 2020 dsjk. All rights reserved.
//

import UIKit
import PhotosUI

class BaseDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DemoTableViewCellDelegate {

    var tableView: UITableView!
    var datas: [String]!
    
    func viewControllerForIndexPath(_ indexPath: IndexPath) -> UIViewController {
        switch indexPath.row {
        case 0:
            return NoNaviBarViewController()
        case 1:
            return RedNaviBarViewController()
        case 2:
            return RedNoBackTitleNaviBarViewController()
        case 3:
            return BlackNaviBarViewController()
        case 4:
            return BlackNoBackTitleNaviBarViewController()
        case 5:
            return DynamicNaviBarViewController()
        case 6:
            return GradientNaviBarViewController()
        case 7:
            return ScrollHeaderViewController()
        case 8:
            return LargeTitleBarViewController()
        case 9:
            return DefaultNaviBarViewController()
        case 10:
            return TransparentBarViewController()
        case 11:
            return ScrollHeaderImageBarViewController()
        default:
            return UIViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datas = ["无导航栏",
                 "红色样式",
                 "红色无返回文字",
                 "黑色样式",
                 "黑色无返回文字",
                 "动态随机样式",
                 "渐变色",
                 "滑动样式一",
                 "大文字标题",
                 "默认样式",
                 "透明导航栏",
                 "滑动样式二"
        ]
        
        view.backgroundColor = .white
        
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissButtonClicked))
    }
    
    @objc func dismissButtonClicked() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath) as! DemoTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let title = datas[indexPath.row]
        let vc = viewControllerForIndexPath(indexPath)
        vc.title = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushButtonClickedAt(_ indexPath: IndexPath) {
        let title = datas[indexPath.row]
        let vc = viewControllerForIndexPath(indexPath)
        vc.title = title
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentButtonClickedAt(_ indexPath: IndexPath) {
        let title = datas[indexPath.row]
        let vc = viewControllerForIndexPath(indexPath)
        vc.title = title
        let navi = BaseNavigationController(rootViewController: vc)
//        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true, completion: nil)
    }
}

