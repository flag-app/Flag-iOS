//
//  FriendsPlusViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import UIKit
import Moya

final class FriendsPlusViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var selectedCellIndex: [Int] = []
    var guestNames: [String] = []
    var numberFriendList: Int = 0
    var friendListData: [FriendList] = [] {
        didSet {
            print("flagListData: \(friendListData)")
        }
    }
    
    // MARK: - UI Components 
    
    private let friendsNameView = FriendsPlusView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(friendsNameView)
        getFriendList()
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
        let flagPlusInfo = FlagPlusInfo.shared
        flagPlusInfo.guestId = guestNames
        let datePickVC = DatePickViewController()
        self.navigationController?.pushViewController(datePickVC, animated: true)
        print(guestNames)
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
        
       
        let guestName = cell.userNicknameLabel.text ?? "닉네임 없음"
        guestNames.append(guestName)
    }
    
    //MARK: -NetWork
    
    func getFriendList() {
            let provider = MoyaProvider<FriendListAPI>()
            
        // Make the API request
        provider.request(.showFriendList) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                        print("Status Code: \(statusCode)")
                        // Process the response data as needed
                        do {
                            let responseData = try response.map([FriendList].self)
                            print(responseData)
                            self.numberFriendList = responseData.count
                            print(self.numberFriendList)
                            self.friendListData = responseData
                            
                            self.friendsNameView.tableView.reloadData()
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }

    
}

// MARK: - TableViewDataSource

extension FriendsPlusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberFriendList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsPlusCell", for: indexPath) as! FriendsPlusCell
        
        cell.userNicknameLabel.text = "\(friendListData[indexPath.row].name)"
        cell.userIdLabel.text = "\(friendListData[indexPath.row].email)"
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
