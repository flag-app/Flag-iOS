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
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.backgroundColor = .gray100
        return view
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()

    // MARK: - Life Cycle
    
    

    // MARK: - Custom Method
    
   
    override func setUI() {
        addSubviews(menuBar,
                    flagCollectionView,
                    button)

    }

    override func setLayout() {
        menuBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        flagCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        button.snp.makeConstraints {
            $0.top.equalTo(flagCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }
}
