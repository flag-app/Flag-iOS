//
//  FlagInfoView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/15.
//

import UIKit

import SnapKit

class FlagInfoView: BaseUIView {
    
    // MARK: Properties
    
    let leadingConstraint = 25
    
    var dataModel: FixedFlagListResponse? {
        didSet {
            if let model = dataModel {
                bind(model)
            }
        }
    }
    
    // MARK: - UI Components
    
    let flagImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.flagInfo
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .title1
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle2
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .subTitle3
        return label
    }()
    
    let userImageView: UserView = {
        let name = ""
        let imageView = UserView(userName: name)
        return imageView
    }()
    
    let memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .subTitle3

        // TextView에 세팅
        textView.attributedText = textView.setLineSpacing(textView.text)
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray200
        return view
    }()
    
    let backGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubview(backGroundView)
        backGroundView.addSubviews(flagImage,
                                   nameLabel,
                                   dateLabel,
                                   locationLabel,
                                   userImageView,
                                   divideLine,
                                   memoTextView
                                   )
    }
    
    override func setLayout() {
        backGroundView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
        }
        flagImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(31)
            $0.leading.equalToSuperview().offset(leadingConstraint)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalTo(flagImage.snp.trailing).offset(15)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(flagImage.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(leadingConstraint)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(leadingConstraint)
        }
        userImageView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(leadingConstraint)
        }
        divideLine.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(80)
            $0.horizontalEdges.equalToSuperview().inset(leadingConstraint)
            $0.height.equalTo(1)
        }
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(17)
            $0.horizontalEdges.equalToSuperview().inset(leadingConstraint)
            $0.height.equalTo(80)
        }
        
    }
    
    func bind(_ data: FixedFlagListResponse) {
        nameLabel.text = data.name
        dateLabel.text = "\(data.date)  \(data.startTime) - \(data.endTime)"
        locationLabel.text = data.place
        memoTextView.text = data.memo
        // FIXME: - user name 해야 됨
    }
    
}
