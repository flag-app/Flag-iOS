//
//  AddFriendViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import UIKit
import Moya

final class AddFriendViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let addFriendView = AddFriendView()
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
        view.addSubviews(addFriendView)
        getFriendList()
    }
    
    override func setLayout() {
        addFriendView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        addFriendView.searchButton.addTarget(self, action: #selector(didTappedFriendSearchButton), for: .touchUpInside)
    }
    
    override func setDelegate(){
        addFriendView.tableView.dataSource = self
    }
    
    @objc
    func didTappedFriendSearchButton() {
        searchFriend()
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
                            
                            self.addFriendView.tableView.reloadData()
                        } catch {
                            print("Response Parsing Error: \(error)")
                        }
                    
                    
                case .failure(let error):
                    // Handle network error
                    print("Network Error: \(error)")
                }
            }
        }
    
    
    func searchFriend() {
        
            let provider = MoyaProvider<FriendSearchAPI>()

            // Create a FlagPlus object with appropriate data
        let flagData = FriendSearch(name: addFriendView.friendSearchTextField.text ?? "")
        print(flagData)
        provider.request(.friendSearch(body: flagData)) { result in
            switch result {
            case .success(let response):
                // Handle successful response
                let responseData = response.data
                        if let dataString = String(data: responseData, encoding: .utf8) {
                            print("Response Data: \(dataString)")
                        }

            case .failure(let error):
                // Handle network error
                print("Network Error: \(error)")
            }
        }

        }
    
}

// MARK: - TableViewDataSource

extension AddFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberFriendList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddFriendCell", for: indexPath) as! AddFriendCell
        
        cell.titleLabel.text = "\(friendListData[indexPath.row].name)"
        cell.subtitleLabel.text = "\(friendListData[indexPath.row].email)"
        cell.deleteButton.addTarget(self, action: #selector(didTappedDeleteButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}

