//
//  NicknameChangeViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/20.
//

import Foundation

final class NicknameChangeViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
   
    private let nicknameChangeView = NicknameChangeView()
    
    // MARK: - Life Cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(nicknameChangeView)
    }
    
    override func setLayout() {
        nicknameChangeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        nicknameChangeView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}



