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
    private let friendListView = FriendListView()
    var selectedCellIndex: Int? = nil
    var numberFriendList: Int = 0
//    var friendListData: [FriendList] = [] {
//        didSet {
//            print("flagListData: \(friendListData)")
//        }
//    }
    var userName: String = ""
    var userEmail: String = ""
    var cellCount: Int = 0

    
    // MARK: - UI Components

    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(addFriendView)
        //getFriendList()
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
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.addFriendText
    }
    
    @objc
    func didTappedFriendSearchButton() {
        serchFriendToServer()
    }
    
    @objc
    func didTappedDeleteButton(_ sender: UIButton) {
        let alertView = UIAlertController(title: TextLiterals.askFriendPlusText, message: "", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: TextLiterals.friendPlusText, style: .default) { _ in
                self.plusFriend()
            self.navigationController?.popToRootViewController(animated: true)
            }
//        { _ in
//            self.plusFriend() // Call the function you want to execute
//        }
        print(userName)
        alertView.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: TextLiterals.flagCancelText, style: .default, handler: nil)
        alertView.addAction(cancelAction)
        present(alertView, animated: true, completion: nil)
    }
    
    //MARK: -NetWork
//    func getFriendList() {
//            let provider = MoyaProvider<FriendListAPI>()
//
//        // Make the API request
//        provider.request(.showFriendList) { result in
//                switch result {
//                case .success(let response):
//                    // Handle successful response
//                    let statusCode = response.statusCode
//                        print("Status Code: \(statusCode)")
//                        // Process the response data as needed
//                        do {
//                            let responseData = try response.map([FriendList].self)
//                            print(responseData)
//                            self.numberFriendList = responseData.count
//                            print(self.numberFriendList)
//                            self.friendListData = responseData
//
//                            self.addFriendView.tableView.reloadData()
//                        } catch {
//                            print("Response Parsing Error: \(error)")
//                        }
//
//
//                case .failure(let error):
//                    // Handle network error
//                    print("Network Error: \(error)")
//                }
//            }
//        }
//
    func serchFriendToServer() {
            let provider = MoyaProvider<FriendsSearchAPI>()

            // Create a FlagPlus object with appropriate data
//            let flagData = FriendSearch(
//                name: "ss"
//            )
        let friendName: String = addFriendView.friendSearchTextField.text ?? ""

            // Make the API request
        provider.request(.friendsSearch(body: friendName)) { result in
            switch result {
            
            case .success(let response):
                // Handle successful response
                let responseData = response.data
                print(responseData)
                if let dataString = String(data: responseData, encoding: .utf8) {
                print("Response Data: \(dataString)")
                                       }
                let statusCode = response.statusCode
                print("Status Code: \(statusCode)")
                do {
                    let responseData = try response.map(FriendSearchResponse.self)
                    print(responseData.result)
                    
                    // Parse the result string to extract name and email
                    if let nameRange = responseData.result.range(of: "name=([a-zA-Z0-9]+)", options: .regularExpression),
                       let emailRange = responseData.result.range(of: "email=([a-zA-Z0-9@.]+)", options: .regularExpression) {
                        let name = String(responseData.result[nameRange].dropFirst(5))
                        let email = String(responseData.result[emailRange].dropFirst(6))
                        
                        print("Name: \(name)")
                        print("Email: \(email)")
                        
                        self.userName = name
                        self.userEmail = email
                        self.cellCount = 1
                        
                        self.addFriendView.tableView.reloadData()
                    }

                    
                } catch {
                    print("Response Parsing Error: \(error)")
                }

            case .failure(let error):
                // Handle network error
                print("Network Error: \(error)")
            }
        }
    }
    
    func plusFriend() {
            let provider = MoyaProvider<FriendPlusAPI>()

            // Create a FlagPlus object with appropriate data
//            let friendName = FriendPlus(
//                friendName: "ss")

            // Make the API request
        provider.request(.friendPlus(body: userName)) { result in
            switch result {
            case .success(let response):
                // Handle successful response
                let responseData = response.data
                print(responseData)
                if let dataString = String(data: responseData, encoding: .utf8) {
                print("Response Data: \(dataString)")
                                       }
                let statusCode = response.statusCode
                print("Status Code: \(statusCode)")
                // Process the response data as needed

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
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddFriendCell", for: indexPath) as! AddFriendCell
        
        cell.titleLabel.text = userName
        cell.subtitleLabel.text = userEmail
        cell.deleteButton.addTarget(self, action: #selector(didTappedDeleteButton(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
}

