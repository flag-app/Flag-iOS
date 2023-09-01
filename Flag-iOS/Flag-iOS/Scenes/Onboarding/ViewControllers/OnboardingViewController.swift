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
    
    func setCollectionView() {
        onboardingView.onboardingCollectionView.register(OnboardingCollectionViewCell.self,
                                                         forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4    
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)
        
        cell.backgroundColor = .blue
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
        return CGSize(width: view.frame.width, height: 400)
    }
}
