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
        setupNavigationPopGesture()
        setUI()
        setLayout()
        addTarget()
        setDelegate()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Custom Method
    
    func setUI() {}
    
    func setLayout() {}
    
    func setupNavigationBar() {
//        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.head1]
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupNavigationPopGesture() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
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
