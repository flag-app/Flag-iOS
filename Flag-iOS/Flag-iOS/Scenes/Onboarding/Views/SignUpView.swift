//
//  SignUpView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//

import UIKit

import SnapKit

class SignUpView: BaseUIView {
    
    // MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Flag 가입하기"
        label.font = .head1
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.inputEmailText
        return label
    }()
    
    private let emailTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.emailHintText
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.inputPasswordText
        return label
    }()
    
    private let passwordTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.passwordHintText
        return textField
    }()
    
    private let passwordCheckLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.doubleCheckPasswordText
        return label
    }()
    
    private let passwordCheckTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.passwordHintText
        return textField
    }()
    
    lazy var signUpNextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(label,
                         emailLabel,
                         emailTextField,
                         passwordLabel,
                         passwordTextField,
                         passwordCheckLabel,
                         passwordCheckTextField,
                         signUpNextButton)
    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        passwordCheckLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        signUpNextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
    }
    
}
