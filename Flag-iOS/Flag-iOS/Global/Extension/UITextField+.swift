//
//  UITextField+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

extension UITextField {
    
    /// 글자 시작위치 변경
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /// border 설정
    func setRoundBorder() {
        layer.masksToBounds = true
        layer.borderColor = UIColor.grayDark1.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 9
    }
}
