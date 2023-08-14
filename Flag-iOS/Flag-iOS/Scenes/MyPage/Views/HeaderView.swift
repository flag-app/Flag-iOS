//
//  HeaderView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit

final class HeaderView: BaseUIView {
//MARK: - porperties
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .title1
        label.text = "시리얼"
        return label
    }()
    
//MARK: -Lifecycle
    
    override init(frame : CGRect){
        super.init(frame: frame)
        configuerUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configuerUI(){
        addSubviews(profileImage,
                    nameLabel)
        
        profileImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(20)
        }


        
    }
}
