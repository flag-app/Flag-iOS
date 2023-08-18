//
//  FriendsPlusCell.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/17.
//

import UIKit

import SnapKit

class FriendsPlusCell: BaseTableViewCell {
    
    // MARK: - Properties
   
    // MARK: - UI Components
    
    let userNicknameLabel: UILabel = {
       let label = UILabel()
       label.font = .subTitle3
       return label
    }()
    
    let userIdLabel: UILabel = {
       let label = UILabel()
       label.font = .body2
       return label
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    lazy var friendPlusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        return button
    }()
    
    var isButtonToggled = false {
            didSet {
                let imageName = isButtonToggled ? "checkFill" : "check"
                friendPlusButton.setImage(UIImage(named: imageName), for: .normal)
            }

        }
    
    // MARK: - LifeCycle
    
    override func prepareForReuse() {
            super.prepareForReuse()
            friendPlusButton.setImage(UIImage(named: "check"), for: .normal)
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        // MARK: - Custom Method
        
    override func setUI(){
        contentView.addSubviews(userNicknameLabel,
                                userIdLabel,
                                profileImage,
                                friendPlusButton)
    }
    
    override func setLayout() {
        userNicknameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.top.equalToSuperview().offset(8)
        }
        userIdLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.top.equalTo(userNicknameLabel.snp.bottom).offset(10)
        }
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(36)
        }
        friendPlusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(343)
        }
    }
}


