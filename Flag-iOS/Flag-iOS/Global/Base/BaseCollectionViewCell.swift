//
//  BaseCollectionViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/10.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {}
    
    func setLayout() {}
}
