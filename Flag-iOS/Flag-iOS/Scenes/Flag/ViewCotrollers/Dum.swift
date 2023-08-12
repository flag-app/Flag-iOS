//
//  Dum.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/11.
//

import UIKit

class SecondViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

