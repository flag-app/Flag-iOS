//
//  SetNicknameView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//

import UIKit

import SnapKit

class SetNicknameView: BaseUIView {
    
    // MARK: - UI Components
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.nicknameText
        return label
    }()
    
    private let emailTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.nicknameHintText
        return textField
    }()
    
    lazy var signUpNextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        self.addSubviews(nicknameLabel,
                         emailTextField,
                         signUpNextButton)
    }
    
    override func setLayout() {
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(7)
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
