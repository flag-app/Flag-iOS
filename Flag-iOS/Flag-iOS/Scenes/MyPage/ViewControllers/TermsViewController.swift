//
//  TermsViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//
import Foundation

import SnapKit
import UIKit

class TermsViewController: BaseUIViewController {
        
    // MARK: - UI Components
    
    private let termsView = TermsView()
        
    // MARK: - Custom Method
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.signUpTitleText
    }
    
    override func setUI() {
        view.addSubviews(termsView)
    }
    
    override func setLayout() {
        termsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
    }
    
    @objc
    func didTappedNextButton() {
        let setNicknameViewController = BaseTabBarController()
        self.navigationController?.pushViewController(setNicknameViewController, animated: true)
    }

}
