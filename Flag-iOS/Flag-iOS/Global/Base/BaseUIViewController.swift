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
    
    private lazy var backButton = UIBarButtonItem(
            image: ImageLiterals.backButtonIcon,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
    
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
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.head1]
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Action Method
    
    func addTarget() {}
    
    // MARK: - delegate Method
    
    func setDelegate() {}
}
