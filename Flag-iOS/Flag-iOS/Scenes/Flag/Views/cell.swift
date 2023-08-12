//
//  cell.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit

import SnapKit

class CustomTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
   
    lazy var actionButton: UIButton = {
        let button = UIButton(type: .custom) // Use custom button type
        button.setImage(UIImage(named: "check"), for: .normal) // Set image for normal state
        button.isEnabled = true
        return button
    }()
    
    var isButtonToggled = false {
            didSet {
                let imageName = isButtonToggled ? "checkFill" : "check"
                actionButton.setImage(UIImage(named: imageName), for: .normal)
            }

        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = .head2
        subtitleLabel.font = .subTitle3
        
        contentView.addSubview(actionButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        actionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(actionButton.snp.right).offset(20)
            make.top.equalToSuperview().offset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(actionButton.snp.right).offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
