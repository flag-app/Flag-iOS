//
//  ListViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/12.
//

import UIKit

final class ListViewController: BaseUIViewController {
    
    // MARK: - UI Components
   
    private let listView = ListView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(listView)
    }
    
    override func setLayout() {
        listView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        listView.button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc
    func tap() {
        print("tap")
    }
}

