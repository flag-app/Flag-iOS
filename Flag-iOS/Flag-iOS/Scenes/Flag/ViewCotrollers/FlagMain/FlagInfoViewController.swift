//
//  FlagInfoViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/15.
//

import UIKit

class FlagInfoViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    let flagInfoView = FlagInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray100
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.flagRawValue
    }
    
    override func setUI() {
        view.addSubview(flagInfoView)
    }
    
    override func setLayout() {
        flagInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
