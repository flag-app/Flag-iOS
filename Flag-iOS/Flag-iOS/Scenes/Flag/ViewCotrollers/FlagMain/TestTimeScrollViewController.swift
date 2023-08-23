//
//  TestTimeScrollViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

class TestTimeScrollViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    var flagId: Int = 0 {
        didSet {
            print("♥️\(flagId)")
        }
    }
    
    // MARK: - UI Components
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.flagRawValue
    }
    


}
