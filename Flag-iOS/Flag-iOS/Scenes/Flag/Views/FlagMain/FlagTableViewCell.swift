//
//  FlagTableViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/12.
//

import UIKit

import SnapKit

class FlagTableViewCell: BaseTableViewCell {
    
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
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023년 7월 18일 19:00 - 21:00"
        label.font = .subTitle3
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "중앙도서관 세미나실 2"
        label.font = .body2
        return label
    }()
    
    let participantLabel: UILabel = {
        let label = UILabel()
        label.text = "노키 외 3명"
        label.font = .body2
        return label
    }()
    
    let dDayView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple300
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let dDayLabel: UILabel = {
        let label = UILabel()
        label.text = "D-2"
        label.font = .title2
        label.textColor = .white
        return label
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        dDayView.addSubview(dDayLabel)
        addSubviews(flagImage,
                    nameLabel,
                    dateLabel,
                    locationLabel,
                    participantLabel,
                    dDayView)
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
        dDayView.snp.makeConstraints {
            $0.top.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(60)
            $0.height.equalTo(21)
        }
        dDayLabel.snp.makeConstraints {
            $0.center.equalTo(dDayView)
        }
    }
}
