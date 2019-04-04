//
//  MainTabBarController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//
import UIKit
@_exported import CYLTabBarController

class MainTabBarController: CYLTabBarController {
    
    // 创建tabbarController
    class func createrMainTabVC() -> MainTabBarController? {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"home_normal",
                             CYLTabBarItemSelectedImage:"home_highlight"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"地址",
                             CYLTabBarItemImage:"mycity_normal",
                             CYLTabBarItemSelectedImage:"mycity_highlight"]
        
        let tabBarItemThree = [CYLTabBarItemTitle:"消息",
                               CYLTabBarItemImage:"message_normal",
                               CYLTabBarItemSelectedImage:"message_highlight"]
        
        let tabBarItemFour = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"account_normal",
                              CYLTabBarItemSelectedImage:"account_highlight"]
        
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
        
        let home = MainNavigationViewController(rootViewController: HomeViewController())
        let connection = MainNavigationViewController(rootViewController: HomeViewController())
        let message = MainNavigationViewController(rootViewController: HomeViewController())
        let personal =   MainNavigationViewController(rootViewController: HomeViewController())
        let viewControllers = [home, connection, message, personal]
        
        let tabBarVC = MainTabBarController.init(viewControllers: viewControllers, tabBarItemsAttributes: tabBarItemsAttributes)
        
        return tabBarVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainTabBarController:UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.updateSelectionStatusIfNeeded(for: tabBarController, shouldSelect: viewController)
        return true
    }
    
}
