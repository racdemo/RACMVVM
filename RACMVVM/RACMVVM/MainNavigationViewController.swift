//
//  MainNavigationViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/18.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 跳转界面隐藏tabbar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
