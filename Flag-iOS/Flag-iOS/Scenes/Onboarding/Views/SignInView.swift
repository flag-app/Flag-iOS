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
    
    private let emailInputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = TextLiterals.inputEmailText
        textField.font = .title2
        textField.backgroundColor = .grayDefault
        textField.addLeftPadding(width: 13)
        textField.setRoundBorder()
        return textField
    }()
    
    private let passwordInputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = TextLiterals.inputPasswordText
        textField.font = .title2
        textField.backgroundColor = .grayDefault
        textField.addLeftPadding(width: 13)
        textField.setRoundBorder()
        return textField
    }()
    
    lazy var signInButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.signIn, for: .normal)
        return button
    }()
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: TextLiterals.resetPassword, titleColor: .grayDark3, fontName: .body2)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: TextLiterals.signUp, titleColor: .grayDark3, fontName: .body2)
        return button
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        self.addSubviews(emailInputTextField,
                         passwordInputTextField,
                         signInButton,
                         resetPasswordButton,
                         signUpButton)
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
