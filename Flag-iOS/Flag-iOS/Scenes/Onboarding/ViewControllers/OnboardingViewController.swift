//
//  OnboardingViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//
import Foundation

import SnapKit

class OnboardingViewController: BaseUIViewController {
        
    private var realm = RealmService()

    // MARK: - UI Components
    
    private let onboardingView = OnboardingView()
        
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(onboardingView)
        
        realm.deleteAllRealmData()
    }
    
    override func setLayout() {
        onboardingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        onboardingView.signInButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
        onboardingView.signUpButton.addTarget(self, action: #selector(didTappedSignUpButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignInButton() {
        let signInViewController = SignInViewController()
        self.navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    @objc
    func didTappedSignUpButton() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
