//
//  UITextView+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/15.
//

import UIKit

extension UITextView {
    /// 행간 설정
    func setLineSpacing(_ text: String) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: text.count))
        return attributedString
    }
}
