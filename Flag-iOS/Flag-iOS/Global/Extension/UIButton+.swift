//
//  UIButton+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

extension UIButton {
    
    /// Button 타이틀 속성 지정
    func addTitleAttribute(title: String, titleColor: UIColor, fontName: UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = fontName
    }

    /// Button border 속성 지정
    func setRoundBorder(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
