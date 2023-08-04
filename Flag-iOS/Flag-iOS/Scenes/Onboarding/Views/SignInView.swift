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
    private let label: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = .head1
        return label
    }()
    
    private let emailInputTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.inputEmailText
        return textField
    }()
    
    private let passwordInputTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.inputPasswordText
        return textField
    }()
    
    lazy var signInButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.signIn, for: .normal)
        return button
    }()
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: TextLiterals.resetPassword, titleColor: .black, fontName: .body2)
        return button
    }()
    
    private let separateLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: TextLiterals.signUp, titleColor: .black, fontName: .body2)
        return button
    }()
    
    private let userInfoSettingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        userInfoSettingStackView.addArrangedSubviews(resetPasswordButton,
                                                     separateLabel,
                                                     signUpButton)
        self.addSubviews(label,
                         emailInputTextField,
                         passwordInputTextField,
                         signInButton,
                         userInfoSettingStackView)

    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.centerX.equalToSuperview()
        }
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
        userInfoSettingStackView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(26)
        }
        separateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
