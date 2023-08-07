//
//  OnboardingViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//
import Foundation

import SnapKit

class OnboardingViewController: BaseUIViewController {
        
    // MARK: - UI Components
    
    private let onboardingView = OnboardingView()
        
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(onboardingView)
    }
    
    override func setLayout() {
        onboardingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        onboardingView.signInButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignInButton() {
        let signInViewController = SignInViewController()
        self.navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    
}
