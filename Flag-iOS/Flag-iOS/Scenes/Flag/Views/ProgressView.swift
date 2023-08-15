//
//  ProgressView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/09.
//

import UIKit

final class ProgressView: BaseUIView {
    
    // MARK: - Properties
    
    var labels: [UILabel] = []
    var stakcViewSpace = 0
    
    // MARK: - UI Components
    
    let sectionCount = 14
    
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagPossibleList
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    private let friendDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagFriendDisplayText
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let indicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.colorIndicator
        return imageView
    }()
    
    lazy var stackview: UIStackView = {
        return stackview
    }()
    
    lazy var modalButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle("나와라 모달!", for: .normal)
        button.isEnabled = true
        return button
    }()
    
    
    // MARK: - Custom Method
    
    override func setUI() {
        stackview = UIStackView(arrangedSubviews: labels)
        self.addSubviews(timeLabel,
                         friendDisplayLabel,
                         collectionView,
                         indicatorImageView,
                         stackview,
                         modalButton)
    }
    
    override func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(25)
        }
        friendDisplayLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(25)
        }
        modalButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(21)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(49)
        }
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(timeLabel.snp.bottom)
            make.bottom.equalTo(modalButton.snp.top).offset(-160)
        }
        indicatorImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.left.equalTo(timeLabel.snp.right).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(timeLabel.snp.bottom)
        }
        stackview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.top.equalTo(collectionView.snp.top).offset(23)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stakcViewSpace = Int((collectionView.bounds.height / CGFloat(sectionCount) - 2))
        updateStackView()
    }
    
    func setLabels(_ labels: [UILabel]) {
            self.labels = labels
            updateStackView()
        }
        
    private func updateStackView() {
        stackview.arrangedSubviews.forEach { $0.removeFromSuperview() }
        labels.forEach { label in
            stackview.addArrangedSubview(label)
        }
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .equalSpacing
        stackview.spacing = CGFloat(stakcViewSpace * 2)
    }
}

