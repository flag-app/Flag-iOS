//
//  SignInView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

import SnapKit

class SignInView: BaseUIView {
    
    // MARK: - UI Components

    private let emailInputTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.inputEmailText
        textField.addLeftImage(image: ImageLiterals.email)
        return textField
    }()
    
    private let passwordInputTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.inputPasswordText
        textField.addLeftImage(image: ImageLiterals.password)
        return textField
    }()
    
    lazy var signInButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.signIn, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        self.addSubviews(emailInputTextField,
                         passwordInputTextField,
                         signInButton)

    }
    
    override func setLayout() {
        emailInputTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(161)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        passwordInputTextField.snp.makeConstraints {
            $0.top.equalTo(emailInputTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        signInButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(276)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
    }
}
