//
//  UILabel+.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/30.
//

import UIKit

extension UILabel {
    func asColor(targetString: String, color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}

//사용예시
//let targetString1 = label.text?.components(separatedBy: " ").first ?? ""
//let targetString2 = label.text?.components(separatedBy: " ").last ?? ""
//let targetString3 = "블로그"
//label.asFontColor(targetStringList: [targetString1 ,targetString2, targetString3], font: .systemFont(ofSize: 30), color: .blue)
