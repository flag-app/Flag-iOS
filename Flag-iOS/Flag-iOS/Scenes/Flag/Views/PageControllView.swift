//
//  File.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/08.
//

import UIKit

import SnapKit

final class PageControllView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var scrollView = UIScrollView()
    
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.pageIndicatorTintColor = .purple5
        pageControl.backgroundStyle = .prominent        
        return pageControl
    }()
    
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(scrollView,
                         pageControl)
    }
    
    override func setLayout() {
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
}

