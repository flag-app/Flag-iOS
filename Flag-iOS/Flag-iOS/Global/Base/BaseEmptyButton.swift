//
//  BaseEmptyButton.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

import SnapKit

class BaseEmptyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEmptyButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupEmptyButton() {
        self.addTitleAttribute(title: "", titleColor: .purpleDefault, fontName: .title1)
        self.setRoundBorder(borderColor: .purpleDefault, borderWidth: 1.0, cornerRadius: 16)
    }
}
