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
    let myPageViewController = MyPageViewController()
    
    lazy var flagNavigationController = UINavigationController(rootViewController: flagViewController)
    lazy var myPageNavigationController = UINavigationController(rootViewController: myPageViewController)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setViewController()
        setFloatingButton()
    }
    
    // MARK: - Custom Method
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .automatic
        let viewControllers: [UIViewController] = [flagNavigationController, myPageNavigationController]
        self.setViewControllers(viewControllers, animated: false)
    }
    
    private func setViewController() {
        flagViewController.tabBarItem = setTabbarItem(title: TextLiterals.flag, image: ImageLiterals.flag, selectedImage: ImageLiterals.flagFill)
        myPageViewController.tabBarItem = setTabbarItem(title: TextLiterals.myPage, image: ImageLiterals.flex, selectedImage: ImageLiterals.flexFill)
    }
    
    private func setTabbarItem(title: String, image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return tabBarItem
    }
   
    private func setFloatingButton() {
        let buttonSize: CGFloat = 64.0
        let floatingButton = UIButton(type: .custom)
        floatingButton.backgroundColor = .purple300
        floatingButton.layer.cornerRadius = buttonSize / 2
        floatingButton.setImage(ImageLiterals.home, for: .normal)
        floatingButton.imageView?.contentMode = .center
        floatingButton.addTarget(self, action: #selector(didTappedFloatingButton), for: .touchUpInside)
        floatingButton.frame = CGRect(x: (self.tabBar.frame.width - buttonSize) / 2,
                                      y: self.tabBar.frame.height - buttonSize - 20,
                                      width: buttonSize,
                                      height: buttonSize)
            
        let label = UILabel()
        label.text = TextLiterals.flagPlus
        label.textAlignment = .center
        label.textColor = .purple300
        label.font = .title3
        label.frame = CGRect(x: 0, y: floatingButton.frame.origin.y + buttonSize, width: self.tabBar.frame.width, height: 30)
        
        self.tabBar.addSubview(floatingButton)
        self.tabBar.addSubview(label)
    }

    @objc
    private func didTappedFloatingButton() {
        let setNameViewController = SetNameViewController()
        setNameViewController.hidesBottomBarWhenPushed = true
        if let selectedNavController = self.selectedViewController as? UINavigationController {
            selectedNavController.pushViewController(setNameViewController, animated: true)
        }
    }
}

