//
//  HeaderViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/16.
//

import Foundation

import SnapKit

class HeaderViewController: BaseUIViewController {
        
    // MARK: - UI Components
    
    private let headerView = HeaderView()
        
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(headerView)
    }
    
    override func setLayout() {
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        headerView.nameButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignInButton() {
        print("dddd")
    }
    
    
}

