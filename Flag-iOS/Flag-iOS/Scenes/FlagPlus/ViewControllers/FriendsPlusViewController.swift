//
//  FriendsPlusViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import UIKit

final class FriendsPlusViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var selectedCellIndex: [Int] = []
    
    // MARK: - UI Components 
    
    private let friendsNameView = FriendsPlusView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(friendsNameView)
    }
    
    override func setLayout() {
        friendsNameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        friendsNameView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        friendsNameView.tableView.dataSource = self
    }
    
    func buttonStatus() {
        if selectedCellIndex.isEmpty {
            friendsNameView.nextButton.isEnabled = false
        } else{
            friendsNameView.nextButton.isEnabled = true
        }
    }
    
    @objc
    func didTappedNextButton() {
        let datePickVC = DatePickViewController()
        self.navigationController?.pushViewController(datePickVC, animated: true)
    }
    
    @objc
    func didTappedFriendPlusButton(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? FriendsPlusCell,
              let indexPath = friendsNameView.tableView.indexPath(for: cell) else {
            return
        }
        
        if selectedCellIndex.contains(indexPath.row) {
            selectedCellIndex.removeAll { $0 == indexPath.row }
        } else {
            selectedCellIndex.append(indexPath.row)
        }
        buttonStatus()
        friendsNameView.tableView.reloadData()
    }

    
}

// MARK: - TableViewDataSource

extension FriendsPlusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsPlusCell", for: indexPath) as! FriendsPlusCell
        
        cell.userNicknameLabel.text = "닉네임 \(indexPath.row + 1)"
        cell.userIdLabel.text = "아이디 : \(indexPath.row + 1)"
        cell.friendPlusButton.addTarget(self, action: #selector(didTappedFriendPlusButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        let checkFillImage = UIImage(named: "checkFill")
        let uncheckImage = UIImage(named: "check")
        
        if selectedCellIndex.contains(indexPath.row) {
            cell.friendPlusButton.setImage(checkFillImage, for: .normal)
        } else {
            cell.friendPlusButton.setImage(uncheckImage, for: .normal)
        }

        return cell
    }
}



