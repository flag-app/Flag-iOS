//
//  LoactionView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import UIKit

import SnapKit

class LoactionView: BaseUIView {
    
    var time: Float = 0.0
    var timer: Timer?
    
    // MARK: - UI Components
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagLocationText
        label.font = .title1
        return label
    }()
    
    private let locationTextField: BaseUITextField = {
        let textField = BaseUITextField()
        return textField
    }()
    
    private let memoLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagMemoText
        label.font = .title1
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
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .gray200
        view.progressTintColor = .purple300
        view.progress = 0.60
        return view
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(locationLabel,
                         locationTextField,
                         memoLabel,
                         memoTextField,
                         nextButton,
                         progressView)
    }
    
    override func setLayout() {
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
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
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
}
