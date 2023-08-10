//
//  MainMenuCollectionViewCell.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/10.
//

import UIKit

class MainMenuCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
//    var selectedItem: Int? {
//        didSet {
//            updateBar(from: selectedItem)
//        }
//    }
    
    override var isHighlighted: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .purple300 : .gray300
        }
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .purple300 : .gray300
        }
    }
    
    // MARK: - UI Components
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray300
        label.font = .head2
        label.textAlignment = .center
//        label.backgroundColor = .blue
        return label
    }()
    
    // MARK: - Custom Method
    
    override func setUI() {
//        backgroundColor = .yellow
        addSubview(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.verticalEdges.equalToSuperview()
        }
    }
    
//    func updateBar(from index: Int?) {
//
//    }
}
