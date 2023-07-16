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
    
    let homeViewController = HomeViewController()
    let flagViewController = FlagViewController()
    let flexViewController = FlexViewController()
    
    lazy var homeNavigationController = UINavigationController(rootViewController: homeViewController)
    lazy var flagNavigationController = UINavigationController(rootViewController: flagViewController)
    lazy var flexNavigationController = UINavigationController(rootViewController: flexViewController)
    
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
        
        let viewControllers: [UIViewController] = [flagViewController, homeViewController, flexViewController]
        self.setViewControllers(viewControllers, animated: true)
    }
    
    private func setViewController() {
        flagViewController.tabBarItem = setTabbarItem(title: TextLiterals.flag, image: ImageLiterals.flag, selectedImage: ImageLiterals.flagFill)
        homeViewController.tabBarItem = setTabbarItem(title: TextLiterals.home, image: ImageLiterals.home, selectedImage: ImageLiterals.homeFill)
        flexViewController.tabBarItem = setTabbarItem(title: TextLiterals.flex, image: ImageLiterals.flex, selectedImage: ImageLiterals.flexFill)
    }
    
    private func setTabbarItem(title: String, image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return tabBarItem
    }
    
}
