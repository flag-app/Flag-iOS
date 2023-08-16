//
//  HeaderView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit

final class HeaderView: BaseUIView {
    
    //MARK: - UI Components
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    lazy var nameButton: UIButton = {
        let button = UIButton()
        button.setTitle("시리얼 >", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    //MARK: -Lifecycle
    
    override init(frame : CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    override func setUI(){
        addSubviews(profileImage,
                    nameButton)
        
        profileImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
        }
        nameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(20)
        }
    }
}
