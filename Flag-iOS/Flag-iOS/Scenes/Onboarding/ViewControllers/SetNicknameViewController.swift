//
//  SetNicknameViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//

import SnapKit

class SetNicknameViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    private let setNicknameView = SetNicknameView()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(setNicknameView)
    }
    
    override func setLayout() {
        setNicknameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

