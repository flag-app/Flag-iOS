//
//  FlagViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/10.
//
import UIKit

import SnapKit

final class FlagViewController: BaseUIViewController {

    // MARK: - UI Components
    
    let cellId = "cellId"
    private let flagView = FlagView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
    }

    // MARK: - Custom Method
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.flag
    }

    override func setUI() {
        view.addSubviews(flagView)

    }

    override func setLayout() {
        flagView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func setDelegate() {
        flagView.flagCollectionView.dataSource = self
        flagView.flagCollectionView.delegate = self
        flagView.menuBar.delegate = self
    }
    
    func setCollectionView() {
        flagView.flagCollectionView.register(FlagCollectionViewCell.self, forCellWithReuseIdentifier: FlagCollectionViewCell.identifier)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        flagView.flagCollectionView.scrollToItem(at: indexPath,
                                                 at: .centeredHorizontally,
                                                 animated: true)
        print("indexPath")
    }

}

// MARK: - UICollectionViewDataSource

extension FlagViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionViewCell.identifier, for: indexPath)
        let color: [UIColor] = [.orange, .blue]
        cell.backgroundColor = color[indexPath.item]
        
        return cell
    }
    
     
}

// MARK: - UICollectionViewDelegate

extension FlagViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FlagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        <#code#>
//    }
}

// MARK: - HomeMenuBarDelegate
extension FlagViewController: HomeMenuBarDelegate {
    func didSelectMenuBarItem(didSelectItemAt item: Int) {
        scrollToMenuIndex(menuIndex: item)
        print("menuIndex: \(item)")
    }
}
