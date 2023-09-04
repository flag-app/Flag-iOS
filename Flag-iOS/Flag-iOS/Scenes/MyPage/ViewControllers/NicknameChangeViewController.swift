//
//  NicknameChangeViewController.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/20.
//

import Foundation

import Moya

final class NicknameChangeViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    //let newUserNickname: String = ""
    
    // MARK: - UI Components
   
    private let nicknameChangeView = NicknameChangeView()
    
    // MARK: - Life Cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.addSubviews(nicknameChangeView)
    }
    
    override func setLayout() {
        nicknameChangeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        nicknameChangeView.nextButton.addTarget(self, action: #selector(didTappedNextButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedNextButton() {
        changeUserNickname()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - NetWork
    
    func changeUserNickname() {
        let provider = MoyaProvider<MyPageAPI>()
        
        let newUserNickname = nicknameChangeView.nameTextField.text ?? ""
        // Make the API request
    provider.request(.changeNickname(requestBody: newUserNickname)) { result in
        switch result {
        case .success(let response):
            // Handle successful response
            let statusCode = response.statusCode
            print("Status Code: \(statusCode)")
            
            // Access response data
            let responseData = response.data
            if let dataString = String(data: responseData, encoding: .utf8) {
                print("Response Data: \(dataString)")
            }
            
            // Access response headers
            let responseHeaders = response.response?.allHeaderFields
            print("Response Headers: \(responseHeaders)")
            
            // Access the entire response object
            print("Entire Response: \(response)")
                
            case .failure(let error):
                // Handle network error
                print("Network Error: \(error)")
            }
        }
    }
    
}



