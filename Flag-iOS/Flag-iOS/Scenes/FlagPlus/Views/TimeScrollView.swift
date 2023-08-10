//
//  TimeScrollView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/06.
//

import UIKit

final class TimeScrollView: BaseUIView {
    
    // MARK: - Properties
    
    var labels: [UILabel] = []
    var stakcViewSpace = 0
    
    // MARK: - UI Components
    
    let sectionCount = 14
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private let TimeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagTimeScrollText
        label.font = .title1
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
    
    lazy var stackview: UIStackView = {
        return stackview
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        stackview = UIStackView(arrangedSubviews: labels)
        self.addSubviews(TimeLabel,
                         collectionView,
                         stackview,
                         nextButton)
    }
    
    func setLabels(_ labels: [UILabel]) {
            self.labels = labels
            updateStackView()
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stakcViewSpace = Int((collectionView.bounds.height / CGFloat(sectionCount) - 2))
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

    
    override func setLayout() {
        TimeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
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
        stackview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.top.equalTo(TimeLabel.snp.bottom).offset(39)
        }
    }
}
