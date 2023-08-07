//
//  FlagPlusViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//
import UIKit

final class FlagPlusViewController: BaseUIViewController {
    
    // MARK: - UI Components
    private let flagOnBoardView = FlagOnboardView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method
    override func setUI() {
        view.addSubviews(flagOnBoardView)
    }
    
    override func setLayout() {
        flagOnBoardView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        flagOnBoardView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    @objc func didTappedNextButton() {
        let setNameViewController =
            SetNameViewController()
        self.navigationController?
            .pushViewController(setNameViewController, animated: true)
        
    }
}
