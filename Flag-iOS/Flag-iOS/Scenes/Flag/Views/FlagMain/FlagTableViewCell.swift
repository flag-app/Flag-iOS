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
    
    var model: FlagStatusInfo? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }
    
    var flagId: Int = 0
    var role: String = ""
    var check: Bool = false
    
    // MARK: - UI Components
    
    let flagImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.flagIcon
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .head2
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle3
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .body2
        return label
    }()
    
    let participantLabel: UILabel = {
        let label = UILabel()
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
    
    func bind(_ model: FlagStatusInfo) {
        switch model {
        case .fixed(let data):
            nameLabel.text = data.name
            dateLabel.text = data.date
            locationLabel.text = data.place
            participantLabel.text = "\(data.host) 외 \(data.count)명"
            dDayLabel.text = data.dday
        case .progress(let data):
            nameLabel.text = data.name
            locationLabel.text = data.place
            participantLabel.text = "\(data.host) 외 \(data.count)명"
            flagId = data.id
            role = data.role
            check = data.check
            dDayView.removeFromSuperview()
        }
    }
}
