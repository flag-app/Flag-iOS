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
    
    private var userDoubleCheckPassword: String = ""
    private let leadingWidth = 25
    
    // MARK: - UI Components
    
    private let signUpTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.signUpAlertText
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
    
    let emailTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.emailHintText
        return textField
    }()
    
    private var emailValidationMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .title3
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.inputPasswordText
        label.font = .subTitle3
        return label
    }()
    
    let passwordTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.passwordHintText
        return textField
    }()
    
    private var passwordValidationMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle3
        label.textColor = .gray400
        return label
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
    
    private var passwordCheckValidationMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일을 입력해주세요"
        label.font = .subTitle3
        label.textColor = .gray400
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.nicknameText
        label.font = .subTitle3
        return label
    }()
    
    let nicknameTextField: BaseUITextField = {
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
    
    private var nicknameValidationMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "사용 가능한 닉네임입니다"
        label.font = .subTitle3
        label.textColor = .gray400
        return label
    }()
    
    lazy var signUpNextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(signUpTitleLabel,
                         emailLabel,
                         emailTextField,
                         emailValidationMessageLabel,
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
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(signUpTitleLabel.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(leadingWidth)
            $0.height.equalTo(41)
        }
        emailValidationMessageLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailValidationMessageLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(leadingWidth)
            $0.height.equalTo(41)
        }
        passwordCheckLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(leadingWidth)
            $0.height.equalTo(41)
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(leadingWidth)
            $0.width.equalTo(255)
            $0.height.equalTo(41)
        }
        nicknameDoubleCheckButton.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(nicknameTextField.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(leadingWidth)
            $0.height.equalTo(41)
        }
        signUpNextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(leadingWidth)
            $0.height.equalTo(49)
        }
    }
 
    func addTarget() {
        nicknameTextField.addTarget(self, action: #selector(nicknameInputChanged), for: .editingChanged)
    }
    
    func setDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordCheckTextField.delegate = self
        nicknameTextField.delegate = self
    }
    
    @objc
    func nicknameInputChanged(_ textField: UITextField) {
        if let userNickname = textField.text, (userNickname.count>1 && userNickname.count<6) {
            nicknameDoubleCheckButton.isEnabled = true
            signUpNextButton.isEnabled = true
        } else {
            nicknameDoubleCheckButton.isEnabled = false
            signUpNextButton.isEnabled = false
        }
    }
    
    
    
    /// 이메일 형식 검사
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    /// user Info Filled check
    func isFilledUserInfo() -> Bool {
        if isFilledTextField(emailTextField.text) && isFilledTextField(passwordTextField.text) &&
            isFilledTextField(passwordCheckTextField.text) &&
            isFilledTextField(nicknameTextField.text) {
            return true
        }
        return false
    }
    
    func isFilledTextField(_ inputValue: String?) -> Bool {
        if let value = inputValue {
            if value != "" {
                return true
            }
        }
        return false
    }
    
}

extension SignUpView: UITextFieldDelegate {
    
    /// return 클릭 시, 키보드 내려감
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// 입력 완료시
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
        if isFilledUserInfo() {
            print("♥️true")
            signUpNextButton.isEnabled = true
        }
    }
    
    /// 각 textFiled 유효성 검사
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let inputValue = textField.text else { return }
        if inputValue.count == 0 {
            textFieldSettingWhenEmpty()
            return
        }
        switch textField {
        case emailTextField:
            emailInputChanged(textField)
        default:
            return
        }
    }

}

private extension SignUpView {
    func textFieldSettingWhenEmpty() {
        emailValidationMessageLabel.text = "필수 입력 사항입니다"
        emailValidationMessageLabel.textColor = .red
    }
    
    func emailInputChanged(_ textField: UITextField) {
        if let userEmail = textField.text {
            if isValidEmail(testStr: userEmail) {
                emailValidationMessageLabel.text = "올바른 이메일 형식입니다"
                emailValidationMessageLabel.textColor = .black
            } else {
                emailValidationMessageLabel.text = "잘못된 이메일 형식입니다"
                emailValidationMessageLabel.textColor = .red
            }
        }
    }
}
