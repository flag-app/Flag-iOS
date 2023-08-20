//
//  SignUpViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/04.
//
import Foundation

import SnapKit
import UIKit
import Moya

class SignUpViewController: BaseUIViewController {
    
    let authProvider = MoyaProvider<AuthAPI>()
        
    // MARK: - UI Components
    
    private let signUpView = SignUpView()
        
    // MARK: - Custom Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postSignUpRequest()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.signUpTitleText
    }
    
    override func setUI() {
        view.addSubviews(signUpView)
    }
    
    override func setLayout() {
        signUpView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        signUpView.signUpNextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        let setNicknameViewController = BaseTabBarController()
        self.navigationController?.pushViewController(setNicknameViewController, animated: true)
    }
    
    func postSignUpRequest() {
        let param = SignUpRequest.init("oo@naver.com", "oo", "oo")
        
        self.authProvider.request(.signUp(body: param)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    /// SUCCESS
                    print("Response status code:", moyaResponse.statusCode)
                    // 추가적으로 moyaResponse.data 를 사용하여 응답 데이터를 파싱할 수 있습니다.
                }
            case .failure(let err):
                /// ERROR
                print("Error:", err.localizedDescription)
            }
        }
        print("❌postSignUpRequest 실행")
    }

       

}

// MARK: - Network

//extension SignUpViewController {
//    var param = SignUpRequest("plpl@naver.com", "pl", "plpl")
//}

