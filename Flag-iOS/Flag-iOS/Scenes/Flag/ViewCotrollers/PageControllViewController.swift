//
//  ProgressViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/09.
//

import UIKit

import SnapKit

final class PageControllViewController: BaseUIViewController {
    
    // MARK: - Properties
   
    
    // MARK: - UI Components
    
    private let pageControllView = PageControllView()
    
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        configureScrollView()
        view.addSubviews(pageControllView)
     
    }
    
    override func setLayout() {
        pageControllView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        
    }
    
    override func setDelegate(){
        
    }
    
    private func configureScrollView() {
        pageControllView.scrollView.contentSize = CGSize(width: view.frame.size.width * 2 , height: pageControllView.scrollView.frame.size.height)
        pageControllView.scrollView.isPagingEnabled = true
        pageControllView.scrollView.showsHorizontalScrollIndicator = false
        
        let viewControllers: [UIViewController] = [
            ProgressViewController(),
            SecondViewController()
        ]
        
        for i in 0..<2 {
            let viewController = viewControllers[i]
            addChild(viewController)
            viewController.view.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: pageControllView.scrollView.frame.size.width, height: pageControllView.scrollView.frame.size.height)
            pageControllView.scrollView.addSubview(viewController.view)
            //viewController.didMove(toParent: self)
        }
        
    }
    
   
}

     // MARK: - CollectionViewDataSource

