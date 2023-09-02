//
//  OnboardingView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/09/01.
//

import UIKit

import SnapKit

class OnboardingView: BaseUIView {
    
    // MARK: - Properties
    
    var onboardingData: [OnboardingDataModel] = []
    
    // MARK: - UI Components
        
     lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray200
         pageControl.currentPageIndicatorTintColor = .gray400
         pageControl.numberOfPages = 4

        return pageControl
    }()
    
    var onboardingCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let skipButton: BaseFillButton = {
        let button = BaseFillButton()
        button.addTitleAttribute(title: TextLiterals.flagPassText, titleColor: .white, fontName: .title1)
        button.isEnabled = true
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setOnboardingData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        addSubviews(onboardingCollectionView,
                    pageControl,
                    skipButton)
    }
    
    override func setLayout() {
        skipButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        onboardingCollectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(35)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(550)
        }
        pageControl.snp.makeConstraints {
            $0.top.equalTo(onboardingCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(150)
            $0.height.equalTo(30)
        }
        
    }
    
    private func setOnboardingData() {
        onboardingData.append(contentsOf: [
            OnboardingDataModel(title: TextLiterals.introFlagText,
                                description: TextLiterals.introFlagSubtext,
                                previewImage: ImageLiterals.onboarding1),
            OnboardingDataModel(title: TextLiterals.makeFlagText,
                                description: TextLiterals.makeFlagSubtext,
                                previewImage: ImageLiterals.onboarding2),
            OnboardingDataModel(title: TextLiterals.registerTimeText,
                                description: TextLiterals.registerTimeSubtext,
                                previewImage: ImageLiterals.onboarding3),
            OnboardingDataModel(title: TextLiterals.confirmedFlagText,
                                description: TextLiterals.confirmedFlagSubtext,
                                previewImage: ImageLiterals.onboarding4)])
            pageControl.numberOfPages = onboardingData.count
    }
    
}
