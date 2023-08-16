//
//  MyPageView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit

import SnapKit

final class MyPageView: BaseUIView {
    
    // MARK: - UI Components
    
    let tableview = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(tableview)
    }
    
    override func setLayout() {
        tableview.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
    }
}
