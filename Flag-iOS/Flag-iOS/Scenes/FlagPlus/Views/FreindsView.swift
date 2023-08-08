//
//  FriendsNameView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//
import UIKit

final class FriendsNameView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagFriendsText
        label.font = .title1
        return label
    }()
   
    private let nameTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.flagFriendsHintText
        return textField
    }()
    
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
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
    }
}
