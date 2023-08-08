//
//  BaseUIViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setUI()
        setLayout()
        addTarget()
        setDelegate()
    }
    
    // MARK: - Custom Method
    
    func setUI() {}
    
    func setLayout() {}
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.head1]
        let backButton: UIBarButtonItem = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    // MARK: - Action Method
    
    func addTarget() {}
    
    // MARK: - delegate Method
    
    func setDelegate() {}
}
