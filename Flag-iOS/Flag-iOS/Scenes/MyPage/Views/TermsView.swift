//
//  TermsView.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/22.
//
import UIKit

import SnapKit

class TermsView: BaseUIView {
    
    // MARK: - UI Components
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var termsText: UITextView = {
        let termsText = UITextView()
        termsText.text = TextLiterals.termsText
        return termsText
    }()
    
    // MARK: - Life Cycle
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.addSubviews(scrollView,
                         termsText)
        
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        termsText.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).offset(25)
            make.horizontalEdges.equalToSuperview().inset(25)
        }
    }
    
}

