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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signInButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.signIn, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
    func addTarget() {
        emailInputTextField.addTarget(self, action: #selector(isChangedValue), for: .editingChanged)
        passwordInputTextField.addTarget(self, action: #selector(isChangedValue), for: .editingChanged)
    }
    
    @objc
    func isChangedValue() {
        if let userEmail = emailInputTextField.text, !userEmail.isEmpty, let userPassword = passwordInputTextField.text, !userPassword.isEmpty {
            signInButton.isEnabled = true
        } else {
            signInButton.isEnabled = false
        }
    }
    
}
