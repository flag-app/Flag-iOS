//
//  AuthViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//
import UIKit

import SnapKit

class AuthViewController: BaseUIViewController {
        
    private var realm = RealmService()

    // MARK: - UI Components
    
    private let authView = AuthView()
        
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(authView)
    }
    
    override func setLayout() {
        authView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        authView.signInButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
        authView.signUpButton.addTarget(self, action: #selector(didTappedSignUpButton), for: .touchUpInside)
        authView.termsButton.addTarget(self, action: #selector(didTappedTermsButton), for: .touchUpInside)
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
    
    @objc
    func didTappedTermsButton() {
        let termsViewController = TermsViewController()
        termsViewController.modalPresentationStyle = .pageSheet
        termsViewController.sheetPresentationController?.prefersGrabberVisible = true
        present(termsViewController, animated: true)
    }
}
