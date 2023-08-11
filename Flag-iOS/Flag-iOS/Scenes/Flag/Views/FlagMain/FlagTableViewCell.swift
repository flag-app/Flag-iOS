//
//  FlagCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/12.
//

import UIKit

import SnapKit

class FlagCell: BaseTableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "FlagCell"
    
    // MARK: - UI Components
    
    let flagImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.flagIcon
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "광고론 팀플 회의"
        label.font = .head2
//        label.backgroundColor = .gray200
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023년 7월 18일 19:00 - 21:00"
        label.font = .subTitle3
//        label.backgroundColor = .blue
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "중앙도서관 세미나실 2"
        label.font = .body2
//        label.backgroundColor = .green
        return label
    }()
    
    let participantLabel: UILabel = {
        let label = UILabel()
        label.text = "노키 외 3명"
        label.font = .body2
//        label.backgroundColor = .red
        return label
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        addSubviews(flagImage,
                    nameLabel,
                    dateLabel,
                    locationLabel,
                    participantLabel)
    }
    
    override func setLayout() {
        flagImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(19)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(flagImage.snp.trailing).offset(8)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(19)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(19)
        }
        participantLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(19)
            $0.bottom.equalToSuperview().inset(33)
        }
    }
}
