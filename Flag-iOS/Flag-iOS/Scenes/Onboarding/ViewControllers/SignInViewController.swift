//
//  SignInViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import SnapKit

class SignInViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    private let signInView = SignInView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(signInView)
    }
    
    override func setLayout() {
        signInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
