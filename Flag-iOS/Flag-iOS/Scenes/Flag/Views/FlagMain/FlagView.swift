//
//  File.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/08.
//

import UIKit

import SnapKit

final class FlagView: BaseUIView {
    
    // MARK: - UI Components
    
    let menuBar = MainMenuBar()
    
    let flagCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.backgroundColor = .gray100
        return view
    }()

    // MARK: - Life Cycle
    
    

    // MARK: - Custom Method
    
   
    override func setUI() {
        addSubviews(menuBar,
                    flagCollectionView)

    }

    override func setLayout() {
        menuBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        flagCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
