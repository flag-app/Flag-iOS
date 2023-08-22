//
//  FriendListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit
import Moya

final class FriendListViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let friendListView = FriendListView()
    var selectedCellIndex: Int? = nil
    var numberFriendList: Int = 0
    var friendListData: [FriendList] = [] {
        didSet {
            print("flagListData: \(friendListData)")
        }
    }

    
    // MARK: - UI Components

    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(friendListView)
        getFriendList()
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
        let deleteAction = UIAlertAction(title: TextLiterals.friendDeleteText, style: .default) { _ in
                self.deleteFriend() 
            }
            alertView.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: TextLiterals.flagCancelText, style: .default, handler: nil)
        alertView.addAction(cancelAction)
        present(alertView, animated: true, completion: nil)
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
                            
                            self.friendListView.tableView.reloadData()
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
    
    func deleteFriend() {
            let provider = MoyaProvider<FriendDeleteAPI>()
            
            // Create a FriendDelete object with the appropriate data
            let friendToDelete = FriendDelete(fid: 38) // Replace with the actual friend ID
            
            // Make the API request
            provider.request(.friendDelete(body: friendToDelete)) { result in
                switch result {
                case .success(let response):
                    // Handle successful response
                    let statusCode = response.statusCode
                    print("Status Code: \(statusCode)")
                    do {
                        // Parse the response data if needed
                        let responseData = try JSONDecoder().decode(FriendDelete.self, from: response.data)
                        // Perform any actions or UI updates based on the responseData
                        
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

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberFriendList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListCell", for: indexPath) as! FriendListCell
        
        cell.titleLabel.text = "\(friendListData[indexPath.row].name)"
        cell.subtitleLabel.text = "\(friendListData[indexPath.row].email)"
        cell.deleteButton.addTarget(self, action: #selector(didTappedDeleteButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}
