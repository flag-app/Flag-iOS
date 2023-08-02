//
//  OnboardingViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import SnapKit

class OnboardingViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    private let onboardingView = OnboardingView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(onboardingView)
    }
    
    override func setLayout() {
        onboardingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
