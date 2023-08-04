//
//  BaseFillButton.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

import SnapKit

class BaseFillButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFillButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupFillButton() {
        self.addTitleAttribute(title: "", titleColor: .white, fontName: .title1)
        self.backgroundColor = .purple200
        self.layer.cornerRadius = 16
    }
}
