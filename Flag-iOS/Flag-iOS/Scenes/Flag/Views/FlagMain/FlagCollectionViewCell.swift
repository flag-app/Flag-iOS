//
//  FlagCollectionViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/12.
//

import UIKit

protocol FlagCollectionViewCellDelegate: AnyObject {
    func didSelectRowInFlagCollectionViewCell(isConfirmed: Bool)
}

class FlagCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "FlagCollectionViewCell"
    weak var delegate: FlagCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    let flagViewController = FlagViewController()
    
    let flagTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        addSubviews(flagTableView)
    }
    
    override func setLayout() {
        flagTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        flagTableView.dataSource = self
        flagTableView.delegate = self
    }
    
    func setTableView() {
        flagTableView.register(FlagTableViewCell.self, forCellReuseIdentifier: FlagTableViewCell.identifier)
    }
}

extension FlagCollectionViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlagTableViewCell.identifier,
                                                 for: indexPath)
        return cell
    }
}

extension FlagCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        delegate?.didSelectRowInFlagCollectionViewCell(isConfirmed: true)
    }
}
