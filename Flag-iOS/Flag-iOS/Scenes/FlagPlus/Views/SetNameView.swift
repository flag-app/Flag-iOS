//
//  SetNameView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//
import UIKit

final class SetNameView: BaseUIView {
    
    // MARK: - Properties
    
    var time: Float = 0.0
    var timer: Timer?
    
    // MARK: - UI Components
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagNameText
        label.font = .title1
        return label
    }()
    
    lazy var nameTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.placeholder = TextLiterals.flagNameHintText
        return textField
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .gray200
        view.progressTintColor = .purple300
        view.progress = 0.0
        return view
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
                         nameLabel,
                         progressView)
        progressAnimation()
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
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalToSuperview().inset(25)
        }
    }
    
    func addTarget() {
        nameTextField.addTarget(self, action: #selector(isChangedValue(_:)), for: .editingChanged)
    }
    
    func progressAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc
        func isChangedValue(_ textField: UITextField) {
            if let flagName = nameTextField.text,(flagName.count > 1 && flagName.count < 15) {
                nextButton.isEnabled = true
            } else {
                nextButton.isEnabled = false
            }
        }

    
    @objc
    func setProgress() {
        time += 0.25
        progressView.setProgress(time, animated: true)
        if time >= 0.20 { timer?.invalidate() }
    }
    
    
}
