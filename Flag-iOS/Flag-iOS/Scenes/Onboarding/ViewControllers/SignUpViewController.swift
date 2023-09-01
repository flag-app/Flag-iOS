//
//  SignUpViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//
import Foundation

import Moya
import SnapKit
import UIKit

class SignUpViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private var realm = RealmService()
    let authProvider = MoyaProvider<AuthAPI>()
        
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
        postSignUpRequest(userEmail: signUpView.emailTextField.text!,
                          userNickname: signUpView.nicknameTextField.text!,
                          userPassword: signUpView.passwordTextField.text!)
      
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Network

extension SignUpViewController {
    func postSignUpRequest(userEmail: String, userNickname: String, userPassword: String) {
        let param = SignUpRequest(email: userEmail, name: userNickname, password: userPassword)
        
        self.authProvider.request(.signUp(body: param)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print("Response status code:", moyaResponse.statusCode)
                }
            case .failure(let err):
                print("Error:", err.localizedDescription)
            }
        }
    }
}

