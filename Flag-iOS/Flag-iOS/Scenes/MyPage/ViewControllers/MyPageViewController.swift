//
//  MyPageViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

import Moya

final class MyPageViewController: BaseUIViewController {
    
    //MARK: - Properties
    
    let myPageMenu = TextLiterals.mypageElements
    let realm = RealmService()
    private let provider = MoyaProvider<MyPageAPI>(plugins: [MoyaLoggerPlugin]())
    
    // MARK: - UI Components
    
    private let mypageView = MyPageView()
    
    // MARK: - Custom Method

    override func viewDidLoad() {
        super.viewDidLoad()
        getNickname()
        
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.myPage
    }
    
    override func setUI() {
        view.addSubviews(mypageView)
        mypageView.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    override func setLayout() {
        mypageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        mypageView.nameButton.addTarget(self, action: #selector(didTappedNameButton), for: .touchUpInside)
    }
    
    override func setDelegate() {
        mypageView.tableview.delegate = self
        mypageView.tableview.dataSource = self
    }
    
    @objc
    func didTappedNameButton() {
        let termsViewController = NicknameChangeViewController()
        termsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(termsViewController, animated: true)
    }
    
    func didTappedSignOutButton() {
 
        let alertView = UIAlertController(title: TextLiterals.signOutText, message: "", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: TextLiterals.yesText, style: .default) { _ in
            // rootView 변경
            let onboardingViewController = OnboardingViewController()
            UIApplication.shared.keyWindow?.replaceRootViewController(onboardingViewController, animated: true, completion: nil)
//            self.navigationController?.popToRootViewController(animated: true)
            self.realm.deleteAllRealmData()
        }
        alertView.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: TextLiterals.noText, style: .default, handler: nil)
        alertView.addAction(cancelAction)
        
        present(alertView, animated: true, completion: nil)
    }
    
}

    //MARK: - TableViewDataSource

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = myPageMenu[indexPath.row]
        cell.textLabel?.font = .title2
        return cell
    }
}

extension MyPageViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            switch indexPath.row {
            case 0:
                let friendListViewController = FriendListViewController()
                navigationController?.pushViewController(friendListViewController, animated: true)
            case 1:
                let termsViewController = TermsViewController()
                navigationController?.pushViewController(termsViewController, animated: true)
            case 2:
                didTappedSignOutButton()
                
//            case 3: // 탈퇴하기
//.           case 4: // 만든사람들
            default:
                break
            }
        }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "앱버전: 1.0.0"
    }
}

// MARK: - Network

extension MyPageViewController {
    
    private func getNickname() {
        self.provider.request(.getNickname) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map(MyPageResponse.self)
                    print(responseData)
                    self.mypageView.userNickname = responseData.name
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
