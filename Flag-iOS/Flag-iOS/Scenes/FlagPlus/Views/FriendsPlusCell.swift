//
//  FriendsPlusCell.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/17.
//

import UIKit

import SnapKit

class FriendsPlusCell: UITableViewCell {
    
    // MARK: - Properties
   
    // MARK: - UI Components
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
   
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        return button
    }()
    
    var isButtonToggled = false {
            didSet {
                let imageName = isButtonToggled ? "checkFill" : "check"
                actionButton.setImage(UIImage(named: imageName), for: .normal)
            }

        }
    
    // MARK: - Custom Method
    
    override func prepareForReuse() {
            super.prepareForReuse()
            actionButton.setImage(UIImage(named: "check"), for: .normal)
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = .subTitle3
        subtitleLabel.font = .body2
        
        contentView.addSubviews(titleLabel,
                                subtitleLabel,
                                profileImage,
                                actionButton)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.top.equalToSuperview().offset(8)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(36)
        }
        actionButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(343)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


