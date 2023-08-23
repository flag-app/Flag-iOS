//
//  FlagCollectionViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/12.
//

import UIKit

protocol FlagCollectionViewCellDelegate: AnyObject {
    func numberOfSections(in tableView: UITableView, at section: Int) -> Int
    func numberOfRows(in tableView: UITableView) -> Int
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView, at section: Int) -> UITableViewCell
    func didSelectRowAt(at indexPath: IndexPath, in tableView: UITableView, at section: Int)
}

class FlagCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "FlagCollectionViewCell"
    weak var delegate: FlagCollectionViewCellDelegate?
    var section: Int = 0
    
    // MARK: - UI Components
        
    let flagTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let refreshControl = UIRefreshControl()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setTableView()
        initRefresh()
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
    
    func initRefresh() {
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        
        flagTableView.refreshControl = refreshControl
    }
    
    @objc
    func refreshTable(refresh: UIRefreshControl) {
        print("새로고침 시작")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.flagTableView.reloadData()
            refresh.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource

extension FlagCollectionViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSections(in: tableView, at: section) ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfRows(in: tableView) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.cellForRow(at: indexPath, in: tableView, at: section) ?? FlagTableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension FlagCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(at: indexPath, in: tableView, at: section)
    }
}
