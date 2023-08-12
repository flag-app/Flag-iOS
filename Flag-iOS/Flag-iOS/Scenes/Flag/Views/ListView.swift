//
//  ListView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//
import UIKit

import SnapKit

final class ListView: BaseUIView {
    
    // MARK: - Properties

    private let leadingWidth = 25
    
    // MARK: - UI Components
    
    private let listTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagPossibleList
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var confirmButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.flagConfirmedText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 140
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        return tableView
    }()

    
    
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(listTitleLabel,
                         confirmButton,
                         tableView)
        
    }
    
    override func setLayout() {
        listTitleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(leadingWidth)
        }
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(49)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(listTitleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(confirmButton.snp.top).offset(-20)
        }
    }
}
