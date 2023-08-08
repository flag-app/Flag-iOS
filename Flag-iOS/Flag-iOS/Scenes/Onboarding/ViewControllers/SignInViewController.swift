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
    
    override func addTarget() {
        signInView.signUpButton.addTarget(self, action: #selector(didTappedSignUpButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignUpButton() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
