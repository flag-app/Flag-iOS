//
//  UserProfileView.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/15.
//
import UIKit

class UserProfileView: BaseUIView {

    // MARK: - UI Components
    
    private let userProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.userProfile
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .body2
        return label
    }()

    init(userName: String, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.userNameLabel.text = userName
        
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setUI() {
        addSubviews(userProfileImage,
                    userNameLabel)
    }

    override func setLayout() {
        userProfileImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()

        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userProfileImage.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
    }
}
