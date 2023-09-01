//
//  OnboardingViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/09/01.
//

import SnapKit

class OnboardingViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    let onboardingView = OnboardingView()
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubview(onboardingView)
    }
    
    override func setLayout() {
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
