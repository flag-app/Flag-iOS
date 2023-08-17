//
//  MyPageView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/13.
//

import UIKit

import SnapKit

final class MyPageView: BaseUIView {
    
    // MARK: - UI Components
    
    let tableview = UITableView(frame: .zero, style: .plain)
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.profileImage
        return imageView
    }()
    
    lazy var nameButton: UIButton = {
        let button = UIButton()
        button.addTitleAttribute(title: "시리얼>", titleColor: .black, fontName: .title1)
        return button
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(tableview,
                         profileImage,
                         nameButton)
    }
    
    override func setLayout() {
        tableview.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(nameButton.snp.bottom).offset(52)
        }
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(51)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.height.width.equalTo(93)
        }
        nameButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(23)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
        
    }
}
