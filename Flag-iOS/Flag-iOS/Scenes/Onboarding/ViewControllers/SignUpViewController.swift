//
//  SignUpViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//
import Foundation

import SnapKit

class SignUpViewController: BaseUIViewController {
        
    // MARK: - UI Components
    
    private let signUpView = SignUpView()
        
    // MARK: - Custom Method
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.signUpTitleText
    }
    
    override func setUI() {
        view.addSubviews(signUpView)
    }
    
    override func setLayout() {
        signUpView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        signUpView.signUpNextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        let setNicknameViewController = SetNicknameViewController()
        self.navigationController?.pushViewController(setNicknameViewController, animated: true)
    }
}
