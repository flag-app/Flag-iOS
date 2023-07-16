//
//  BaseViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        addTarget()
        setDelegate()
    }
    
    // MARK: - Custom Method
    
    func setUI() {
        view.backgroundColor = .gray100
    }
    
    func setLayout() {}
    
    // MARK: - Action Method
    
    func addTarget() {}
    
    // MARK: - delegate Method
    
    func setDelegate() {}
}
