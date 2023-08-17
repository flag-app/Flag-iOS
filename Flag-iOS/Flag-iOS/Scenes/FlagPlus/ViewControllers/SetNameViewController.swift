//
//  SetNameViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/05.
//

import Foundation

final class SetNameViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
   
    private let setNameView = SetNameView()
    
    // MARK: - Life Cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(setNameView)
    }
    
    override func setLayout() {
        setNameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        setNameView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        let homeVC = FriendsPlusViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}


