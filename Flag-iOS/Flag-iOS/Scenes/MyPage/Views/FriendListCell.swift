//
//  FriendListCell.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/15.
//

import UIKit

import SnapKit

class FriendListCell: UITableViewCell {
    
    // MARK: - Properties
   
    // MARK: - UI Components
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
   
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: TextLiterals.deleteText, titleColor: .black, fontName: .body2)
        button.backgroundColor = .gray200
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    // MARK: - Custom Method
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = .subTitle3
        subtitleLabel.font = .body2
        
        contentView.addSubviews(deleteButton,
                                titleLabel,
                                subtitleLabel,
                                profileImage)
        
        
        deleteButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(290)
            make.trailing.equalToSuperview().inset(23)
            make.centerY.equalToSuperview()
        }
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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

