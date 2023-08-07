//
//  SignUpView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//

import UIKit

import SnapKit

class SignUpView: BaseUIView {
    
    // MARK: - Properties
    private var userEmail: String = ""
    private var userPassword: String = ""
    private var userDoubleCheckPassword: String = ""
    private var userNickname: String = ""
    
    // MARK: - UI Components
    private let signUpTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.signUpTitleText
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.inputEmailText
        label.font = .subTitle3
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
        label.font = .subTitle3
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
        label.font = .subTitle3
        return label
    }()
    
    private let passwordCheckTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.passwordHintText
        return textField
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.nicknameText
        label.font = .subTitle3
        return label
    }()
    
    private let nicknameTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.nicknameHintText
        return textField
    }()
    
    lazy var nicknameDoubleCheckButton: BaseFillButton = {
        let button = BaseFillButton()
        button.addTitleAttribute(title: TextLiterals.doubleCheck, titleColor: .white, fontName: .subTitle3)
        button.layer.cornerRadius = 9.0
        return button
    }()
    
    lazy var signUpNextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(signUpTitleLabel,
                         emailLabel,
                         emailTextField,
                         passwordLabel,
                         passwordTextField,
                         passwordCheckLabel,
                         passwordCheckTextField,
                         nicknameLabel,
                         nicknameTextField,
                         nicknameDoubleCheckButton,
                         signUpNextButton)
    }
    
    override func setLayout() {
        signUpTitleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(signUpTitleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(25)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        passwordCheckLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(25)
            $0.width.equalTo(255)
            $0.height.equalTo(41)
        }
        nicknameDoubleCheckButton.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(nicknameTextField.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        signUpNextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
    }
    
}
