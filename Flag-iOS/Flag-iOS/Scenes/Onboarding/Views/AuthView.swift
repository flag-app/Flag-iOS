//
//  AuthView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

import SnapKit

class AuthView: BaseUIView {
    
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
    
    lazy var termsButton: UIButton = {
        let button = UIButton()
        let fullText = TextLiterals.termsCheckText
        let coloredText = "서비스 이용약관" 
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.purple300, range: (fullText as NSString).range(of: coloredText))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTitleAttribute(title: fullText, titleColor: .black, fontName: .title3)
        return button
    }()
    
    // MARK: - Custom Method

    override func setUI() {
        self.addSubviews(onboardingImageView,
                         signInButton,
                         signUpButton,
                         termsButton)
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
        termsButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
}
