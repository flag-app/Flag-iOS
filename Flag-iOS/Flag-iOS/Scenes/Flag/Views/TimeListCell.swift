//
//  cell.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit

import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var ableUserName: [String] = [] {
            didSet {
                updateImageView()
            }
        }
   
    // MARK: - UI Components
    
    let dateAndTimeLabel = UILabel()
//    let possibleUserLabel = UILabel()
    
    let ableUserImageView = AbleUsersView.renderStackViewWithUsers(userNames: [])

   
    lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal) 
        return button
    }()
    
    var isButtonToggled = false {
            didSet {
                let imageName = isButtonToggled ? "checkFill" : "check"
                selectButton.setImage(UIImage(named: imageName), for: .normal)
            }

        }
    
    // MARK: - Custom Method

    override func prepareForReuse() {
            super.prepareForReuse()
            selectButton.setImage(UIImage(named: "check"), for: .normal)
        }
    
    func updateImageView() {
        ListUsersView.updateStackViewWithUsers(ableUserImageView, userNames: ableUserName)
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dateAndTimeLabel.font = .head2
        //possibleUserLabel.font = .subTitle3
        
        contentView.addSubviews(selectButton,
                                dateAndTimeLabel,
                                ableUserImageView)
    
        
        selectButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        dateAndTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalToSuperview().offset(8)
        }
        
        ableUserImageView.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalTo(dateAndTimeLabel.snp.bottom).offset(10)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ListUsersView {
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
