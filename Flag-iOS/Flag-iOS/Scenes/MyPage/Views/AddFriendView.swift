//
//  AddFriendView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import UIKit

import SnapKit

final class AddFriendView: BaseUIView {
    
    // MARK: - Properties

    private let leadingWidth = 25
    
    // MARK: - UI Components
    
    lazy var friendSearchTextField: BaseUITextField = {
        let textField = BaseUITextField()
        textField.addLeftImage(image: ImageLiterals.searchIcon)
        textField.placeholder = TextLiterals.flagFriendsHintText
        return textField
    }()
    
    lazy var searchButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.searchText, for: .normal)
        button.layer.cornerRadius = 6
        button.isEnabled = true
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.register(AddFriendCell.self, forCellReuseIdentifier: "AddFriendCell")
        return tableView
    }()

    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(friendSearchTextField,
                         searchButton,
                         tableView)
        
    }
    
    override func setLayout() {
        friendSearchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().inset(23)
            $0.trailing.equalToSuperview().inset(120)
            $0.height.equalTo(41)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().inset(290)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(41)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(friendSearchTextField.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


