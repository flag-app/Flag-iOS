//
//  FriendListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit

final class FriendListViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let friendListView = FriendListView()
    var selectedCellIndex: Int? = nil
    
    // MARK: - UI Components

    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(friendListView)
    }
    
    override func setLayout() {
        friendListView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        friendListView.searchButton.addTarget(self, action: #selector(didTappedFriendSearchButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        friendListView.tableView.dataSource = self
    }
    
    @objc
    func didTappedFriendSearchButton() {
        print("tap")
    }
    
    @objc
    func didTappedDeleteButton(_ sender: UIButton) {
        let alertView = UIAlertController(title: TextLiterals.DeleteQuestionText, message: "", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: TextLiterals.friendDeleteText, style: .default, handler: nil)
        alertView.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: TextLiterals.flagCancelText, style: .default, handler: nil)
        alertView.addAction(cancelAction)
        present(alertView, animated: true, completion: nil)
    }
}

// MARK: - TableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListCell", for: indexPath) as! FriendListCell
        
        cell.titleLabel.text = "닉네임 \(indexPath.row + 1)"
        cell.subtitleLabel.text = "아이디 : \(indexPath.row + 1)"
        cell.deleteButton.addTarget(self, action: #selector(didTappedDeleteButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}
