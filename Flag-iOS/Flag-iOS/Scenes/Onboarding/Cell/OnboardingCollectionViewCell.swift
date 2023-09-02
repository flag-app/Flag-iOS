//
//  OnboardingCollectionViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/09/01.
//

import UIKit

import SnapKit

class OnboardingCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    // MARK: - UI Components
    
    private var onboardingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .head1
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var onboardingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle3
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var onboardingPreviewImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: - Custom Method
    
    func setOnboardingSlides(_ slides: OnboardingDataModel) {
        onboardingTitleLabel.text = slides.title
        onboardingDescriptionLabel.text = slides.description
        onboardingPreviewImage.image = slides.previewImage
    }
    
    override func setUI() {
        addSubviews(onboardingTitleLabel,
                   onboardingDescriptionLabel,
                   onboardingPreviewImage)
    }
    
    override func setLayout() {
        onboardingTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.centerX.equalToSuperview()
        }
        onboardingDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(onboardingTitleLabel.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        onboardingPreviewImage.snp.makeConstraints {
            $0.top.equalTo(onboardingDescriptionLabel.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
        }
    }
}
