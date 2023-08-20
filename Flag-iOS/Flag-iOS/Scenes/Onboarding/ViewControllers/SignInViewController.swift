//
//  SignInViewController.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/02.
//
import Foundation

import SnapKit
import UIKit
import Moya

class SignInViewController: BaseUIViewController {
    
    let authProvider = MoyaProvider<AuthAPI>()
        
    // MARK: - UI Components
    
    private let signInView = SignInView()
    
    // MARK: - Custom Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = TextLiterals.signIn
    }

    override func setUI() {
        view.addSubviews(signInView)
    }
    
    override func setLayout() {
        signInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
        signInView.signInButton.addTarget(self, action: #selector(didTappedSignInButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedSignInButton() {
        let tabBarController = BaseTabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
  

}


extension SignInViewController {
    
    func login() {
        let param = SignInRequest(email: "oo@naver.com", password: "oo")
        
        self.authProvider.request(.signIn(body: param)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    /// SUCCESS
                    print("Response status code:", moyaResponse.statusCode)
                    
                    // moyaResponse.data 를 사용하여 응답 데이터를 파싱합니다.
//                    let decoder = JSONDecoder()
//                    let signInResponse = try decoder.decode(SignInResponse.self, from: moyaResponse.data)
//                    let result = try moyaResponse.map(SignInResponse.self)
                    
//                    print("Access Token:", moyaResponse.data)
                    if let accessToken = String(data: moyaResponse.data, encoding: .utf8) {
                        print("Access Token:", accessToken)
                    } else {
                        print("Failed to decode token.")
                    }

                } catch let parsingError {
                    print("Error parsing:", parsingError)
                }
            case .failure(let err):
                /// ERROR
                print("Error:", err.localizedDescription)
            }
        }
        print("❌login 실행")
    }
}
