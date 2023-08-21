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
    
    lazy var friendDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagFriendDisplayText
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var acceptUsersLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagAcceptUsersText
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nonResponseLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagNonResponseUsersText
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 0 , height: 850)
       return scrollView
    }()
    

    lazy var membersDisplayLabel: UILabel = {
        let label = UILabel()
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var acceptUsers: UILabel = {
        let label = UILabel()
        label.font = .title1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nonResponseUsers: UILabel = {
        let label = UILabel()
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
    
    lazy var modalButton: BaseEmptyButton = {
        let button = BaseEmptyButton()
        button.setTitle("약속 리스트", for: .normal)
        button.isEnabled = true
        return button
    }()
    
    
    // MARK: - Custom Method
    
    override func setUI() {
        stackview = UIStackView(arrangedSubviews: labels)
        self.addSubviews(timeLabel,
                         modalButton,
                         //더미
                         membersDisplayLabel,
                         scrollView,
                         indicatorImageView)
        
        scrollView.addSubviews(friendDisplayLabel,
                               collectionView,
                               stackview,
                               acceptUsersLabel,
                               nonResponseLabel,
                               acceptUsers,
                               nonResponseUsers)
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
            make.top.equalTo(scrollView).offset(22)
            make.height.equalTo(475)
            //make.bottom.equalTo(modalButton.snp.top).offset(-160)
        }
        indicatorImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.left.equalTo(timeLabel.snp.right).offset(40)
            make.height.equalTo(21)
            make.width.equalTo(109)
        }
        stackview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.top.equalTo(collectionView.snp.top).offset(29)
        }
        
        membersDisplayLabel.snp.makeConstraints { make in
            make.top.equalTo(friendDisplayLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(25)
        }
       
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.bottom.equalTo(modalButton.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        acceptUsersLabel.snp.makeConstraints { make in
            make.top.equalTo(friendDisplayLabel.snp.bottom).offset(85)
            make.leading.equalToSuperview().offset(25)
        }
        acceptUsers.snp.makeConstraints { make in
            make.top.equalTo(acceptUsersLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(25)
        }
        nonResponseLabel.snp.makeConstraints { make in
            make.top.equalTo(acceptUsersLabel.snp.bottom).offset(85)
            make.leading.equalToSuperview().offset(25)
        }
        nonResponseUsers.snp.makeConstraints { make in
            make.top.equalTo(nonResponseLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(25)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stakcViewSpace = 31
//        Int((collectionView.bounds.height / CGFloat(sectionCount) - 2))
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

