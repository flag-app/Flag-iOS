//
//  LoactionView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import UIKit

import SnapKit

class LoactionView: BaseUIView {
    
    // MARK: - UI Components

    private let minimumTimeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagMinimumTimeText
        return label
    }()
    
    private let minimumTimeTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.flagMinimumTimeHintText
        return textField
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagLocationText
        return label
    }()
    
    private let locationTextField: BaseUITextField = {
        let textField = BaseUITextField()
        return textField
    }()
    
    private let memoLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagMemoText
        return label
    }()
    
    private let memoTextField: BaseUITextField = {
        let textField = BaseUITextField()
        return textField
    }()
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(minimumTimeLabel,
                         minimumTimeTextField,
                         locationLabel,
                         locationTextField,
                         memoLabel,
                         memoTextField,
                         nextButton)
    }
    
    override func setLayout() {
        minimumTimeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        minimumTimeTextField.snp.makeConstraints {
            $0.top.equalTo(minimumTimeLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(minimumTimeTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(41)
        }
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        memoTextField.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(192)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
    }
    
}
