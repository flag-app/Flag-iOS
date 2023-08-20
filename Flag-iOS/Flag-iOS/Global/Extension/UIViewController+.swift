//
//  UIViewController+.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/20.
//

import UIKit

extension UIViewController {
    
    /// 키보드 위 화면 터치 시, 키보드 내리기
    func hideKeyboardWhenTappedAround() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapped.cancelsTouchesInView = false
        view.addGestureRecognizer(tapped)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
