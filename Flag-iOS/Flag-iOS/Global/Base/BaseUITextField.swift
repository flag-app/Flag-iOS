//
//  BaseUITextField.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/03.
//

import UIKit

final class BaseUITextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.font = .title2
        self.backgroundColor = .gray100
        self.addLeftPadding(width: 13)
        self.setRoundBorder()
    }
}
