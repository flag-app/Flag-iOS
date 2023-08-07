//
//  TimeScrollView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/06.
//

import UIKit

final class TimeScrollView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        return button
    }()
    
    private let TimeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagTimeScrollText
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(TimeLabel,
                         collectionView,
                         nextButton)
    }
    
    override func setLayout() {
        TimeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(93)
            $0.leading.equalToSuperview().offset(25)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(TimeLabel.snp.bottom)
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
    }
    
}


    
    
