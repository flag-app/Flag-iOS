//
//  File.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/08.
//

import UIKit

import SnapKit

final class FlagView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var nextButton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle(TextLiterals.nextText, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    
    // MARK: - Custom Method
    override func setUI() {
        self.addSubviews(nextButton)
    }
    
    override func setLayout() {
        nextButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(49)
        }
    }
}
