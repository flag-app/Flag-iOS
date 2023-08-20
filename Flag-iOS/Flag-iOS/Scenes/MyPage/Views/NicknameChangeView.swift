//
//  NicknameChangeView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/20.
//

import UIKit

final class NicknameChangeView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.completeText, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.newNicknameText
        label.font = .title1
        return label
    }()
    
    private let nameTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.newNicknameTextHint
        return textField
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
        self.addSubviews(nextButton,
                         nameTextField,
                         nameLabel)
    }
    override func setLayout() {
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(25)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
    }
    
    func addTarget() {
        nameTextField.addTarget(self, action: #selector(isChangedValue(_:)), for: .editingChanged)
    }
    
    @objc
        func isChangedValue(_ textField: UITextField) {
            if let flagName = nameTextField.text,(flagName.count > 2 && flagName.count < 15) {
                nextButton.isEnabled = true
            } else {
                nextButton.isEnabled = false
            }
        }
}

