//
//  BaseTabBarController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit
 
import SnapKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - UI Components
    
    let flagViewController = FlagViewController()
    let flagPlusViewController = FlagPlusViewController()
    let myPageViewController = MyPageViewController()
    
    lazy var flagNavigationController = UINavigationController(rootViewController: flagViewController)
    lazy var flagPlusNavigationController = UINavigationController(rootViewController: flagPlusViewController)
    lazy var myPageNavigationController = UINavigationController(rootViewController: myPageViewController)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setViewController()
    }
    
    // MARK: - Custom Method
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .centered
        
        let viewControllers: [UIViewController] = [flagViewController, flagPlusViewController, myPageViewController]
        self.setViewControllers(viewControllers, animated: true)
    }
    
    private func setViewController() {
        flagViewController.tabBarItem = setTabbarItem(title: TextLiterals.flag, image: ImageLiterals.flag, selectedImage: ImageLiterals.flagFill)
        flagPlusViewController.tabBarItem = setTabbarItem(title: TextLiterals.flagPlus, image: ImageLiterals.home, selectedImage: ImageLiterals.homeFill)
        myPageViewController.tabBarItem = setTabbarItem(title: TextLiterals.myPage, image: ImageLiterals.flex, selectedImage: ImageLiterals.flexFill)
        
    }
    
    private func setTabbarItem(title: String, image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return tabBarItem
    }
    
}
