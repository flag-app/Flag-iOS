//
//  MyPageViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

final class MyPageViewController: BaseUIViewController {
    
    //MARK: - Properties
    
    let myPageMenu = ["친구 목록" , "이용약관", "로그아웃" , "탈퇴하기" ]
    
    // MARK: - UI Components
    
    private let mypageView = MyPageView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
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
        
    }
    
    override func setDelegate() {
        mypageView.tableview.delegate = self
        mypageView.tableview.dataSource = self
    }
    
}
extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = myPageMenu[indexPath.row]
        return cell
    }
}

extension MyPageViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header  = HeaderView()

        header.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            switch indexPath.row {
            case 0:
                let friendListViewController = FriendListViewController()
                navigationController?.pushViewController(friendListViewController, animated: true)
            case 1:
                let termsViewController = TermsViewController()
                navigationController?.pushViewController(termsViewController, animated: true)
//            case 2: // "로그아웃"
//                // 로그아웃 로직을 구현하거나 필요한 동작을 수행하세요.
//            case 3: // "탈퇴하기"
//                // 탈퇴 로직을 구현하거나 필요한 동작을 수행하세요.
            default:
                break
            }
        }
}
