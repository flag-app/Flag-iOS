//
//  FriendsNameView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//
import UIKit

final class FriendsNameView: BaseUIView {
    
    // MARK: - Properties
    
    var time: Float = 0.0
    var timer: Timer?
    
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
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .gray200
        view.progressTintColor = .purple300
        view.progress = 0.16
        return view
    }()
    
    //수정필요
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.register(FriendListCell.self, forCellReuseIdentifier: "FriendListCell")
        return tableView
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(nextButton,
                         nameTextField,
                         nameLabel,
                         progressView,
                         tableView)
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
            make.leading.trailing.equalToSuperview().inset(25)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-23)
        }
    }
    
    func progressAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc
    func setProgress() {
        time += 0.05
        progressView.setProgress(time, animated: true)
        if time >= 0.40 { timer?.invalidate() }
    }
}
