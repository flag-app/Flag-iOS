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
    
   
    // MARK: - UI Components
    
    let dateAndTimeLabel = UILabel()
    let possibleUserLabel = UILabel()
   
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dateAndTimeLabel.font = .head2
        possibleUserLabel.font = .subTitle3
        
        contentView.addSubviews(selectButton,
                                dateAndTimeLabel,
                                possibleUserLabel)
    
        
        selectButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        dateAndTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalToSuperview().offset(8)
        }
        
        possibleUserLabel.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalTo(dateAndTimeLabel.snp.bottom).offset(10)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
