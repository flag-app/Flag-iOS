//
//  ListView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//
import UIKit

import SnapKit

final class ListView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.backgroundColor = .systemBlue
    return button
    }()
    
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(button)
        
    }
    
    override func setLayout() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
