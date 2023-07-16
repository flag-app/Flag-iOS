//
//  UIStackView+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
