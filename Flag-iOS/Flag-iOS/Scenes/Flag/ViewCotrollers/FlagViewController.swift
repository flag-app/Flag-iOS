//
//  FlagViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

final class FlagViewController: BaseUIViewController {
    
    // MARK: - UI Components
    private let flagView = FlagView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method
    override func setUI() {
        view.addSubviews(flagView)
        self.view.backgroundColor = .green
    }
    
    override func setLayout() {
        flagView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        flagView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    @objc func didTappedNextButton() {
        let progressViewController =
            ProgressViewController()
        self.navigationController?
            .pushViewController(progressViewController, animated: true)
        
    }
}
