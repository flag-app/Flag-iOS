//
//  OnboardingViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/09/01.
//

import UIKit

import SnapKit

class OnboardingViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var currentPage: Int = 0 {
        didSet {
            onboardingView.pageControl.currentPage = currentPage
            print(currentPage)
        }
    }
    
    // MARK: - UI Components
    
    let onboardingView = OnboardingView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubview(onboardingView)
    }
    
    override func setLayout() {
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setDelegate() {
        onboardingView.onboardingCollectionView.dataSource = self
        onboardingView.onboardingCollectionView.delegate = self
    }
    
    override func addTarget() {
        onboardingView.skipButton.addTarget(self, action: #selector(didTappedAuthButton), for: .touchUpInside)
    }
    
    func setCollectionView() {
        onboardingView.onboardingCollectionView.register(OnboardingCollectionViewCell.self,
                                                         forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
    
    @objc
    func didTappedAuthButton() {
        let authViewController = AuthViewController()
        self.navigationController?.pushViewController(authViewController, animated: true)
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4    
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.setOnboardingSlides(onboardingView.onboardingData[indexPath.row])
        return cell
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / view.frame.width)
        currentPage = page
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 515)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
