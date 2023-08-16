//
//  SignInViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//
import Foundation

import SnapKit
import UIKit

class SignInViewController: BaseUIViewController {
        
    // MARK: - UI Components
    
    private let signInView = SignInView()
    
    // MARK: - Custom Method
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.signIn
    }

    override func setUI() {
        view.addSubviews(signInView)
    }
    
    override func setLayout() {
        signInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        signInView.signInButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignInButton() {
        let tabBarController = BaseTabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
}
