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
    
    var ableUserName: [String] = [] {
            didSet {
                updateImageView()
            }
        }
        
        var responseUserName: [String] = [] {
            didSet {
                updateResponseView()
            }
        }
        
        var nonResponseUserName: [String] = [] {
            didSet {
                updateNonResponseView()
            }
        }
        
    
    // MARK: - UI Components
    
    let sectionCount = 14
    
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagPossibleTimeList
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
    
    lazy var PrimaryUserLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiterals.flagPrimaryUserText
        label.font = .body3
        label.numberOfLines = 0
        return label
    }()
    
    lazy var AllUserCountLabel: UILabel = {
        let label = UILabel()
        label.text = "14"
        label.font = .body3
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
    
    let ableUserImageView = AbleUsersView.renderStackViewWithUsers(userNames: [])
    
    let responseUserImageView = AbleUsersView.renderStackViewWithUsers(userNames: ["최지우", "성현주"])

    let nonResponseUserImageView = AbleUsersView.renderStackViewWithUsers(userNames: ["최지우", "성현주"])
    
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
                         scrollView,
                         indicatorImageView,
                         PrimaryUserLabel,
                         AllUserCountLabel)
        
        scrollView.addSubviews(friendDisplayLabel,
                               collectionView,
                               stackview,
                               acceptUsersLabel,
                               nonResponseLabel,
                               ableUserImageView,
                               responseUserImageView,
                               nonResponseUserImageView)
    }
    
    override func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(25)
        }
        PrimaryUserLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(timeLabel.snp.trailing).offset(17)
        }
        AllUserCountLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(indicatorImageView.snp.trailing).offset(4)
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
        }
        indicatorImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.height.equalTo(21)
            make.leading.equalTo(PrimaryUserLabel.snp.trailing).offset(4)
//            make.trailing.equalTo(AllUserCountLabel.snp.leading).offset(4)
            make.width.equalTo(109)
        }
        stackview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.top.equalTo(collectionView.snp.top).offset(29)
        }
        
        ableUserImageView.snp.makeConstraints { make in
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
        responseUserImageView.snp.makeConstraints { make in
            make.top.equalTo(acceptUsersLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(25)
        }
        nonResponseLabel.snp.makeConstraints { make in
            make.top.equalTo(acceptUsersLabel.snp.bottom).offset(85)
            make.leading.equalToSuperview().offset(25)
        }
        nonResponseUserImageView.snp.makeConstraints { make in
            make.top.equalTo(nonResponseLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(25)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stakcViewSpace = 31
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
    
    
    func updateImageView() {
            AbleUsersView.updateStackViewWithUsers(ableUserImageView, userNames: ableUserName)
        }
        func updateNonResponseView() {
            AbleUsersView.updateStackViewWithUsers(nonResponseUserImageView, userNames: nonResponseUserName)
        }
        func updateResponseView() {
            AbleUsersView.updateStackViewWithUsers(responseUserImageView, userNames: responseUserName)
        }
        
    }



    class AbleUsersView {
        
        /// 인자로 받은 User들의 UserProfileView 반환
        static func renderStackViewWithUsers(userNames: [String]) -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 47
            updateStackViewWithUsers(stackView, userNames: userNames)
            return stackView
        }
        
        static func updateStackViewWithUsers(_ stackView: UIStackView, userNames: [String]) {
            stackView.arrangedSubviews.forEach { $0.removeFromSuperview() } // 기존의 subviews를 모두 제거

            for userName in userNames {
                let userView = UserProfileView(userName: userName)
                stackView.addArrangedSubview(userView)
            }
        }
    }





