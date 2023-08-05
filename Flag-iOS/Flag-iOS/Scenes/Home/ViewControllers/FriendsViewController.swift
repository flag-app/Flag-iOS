//
//  SetNameViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import Foundation
final class FriendsViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    private let friendsNameView = FriendsNameView()
    
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
    
    @objc
    func didTappedNextButton() {
        let homeVC = DatePickViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}


