//
//  OnboardingView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

import SnapKit

class OnboardingView: BaseUIView {
    
    // MARK: - UI Components
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.onboardingLogo
        return imageView
    }()
    
    lazy var signInButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.signIn, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    lazy var signUpButton: BaseEmptyButton = {
        let button = BaseEmptyButton()
        button.setTitle(TextLiterals.signUp, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        self.addSubviews(onboardingImageView,
                         signInButton,
                         signUpButton)
    }
    
    override func setLayout() {
        onboardingImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(139)
            make.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom).offset(148)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(49)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(49)
        }
    }
    
}
