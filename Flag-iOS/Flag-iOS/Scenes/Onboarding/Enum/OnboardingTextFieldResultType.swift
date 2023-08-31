//
//  OnboardingTextFieldResultType.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/31.
//

import Foundation
import UIKit

enum OnboardingTextFieldResultType {
    /// common
    case textFieldEmpty
    /// email
    case emailTextFieldValid
    case emailTextFieldInvalid
    /// password
    case passwordTextFieldDoubleCheckFalse
    /// nickname
    case nicknameTextFieldOver
    case nicknameTextFieldDuplicated
    case nicknameTextFieldDoubleCheck
    case nicknameTextFieldValid
    
    var errorMessage: String {
        switch self {
        case .textFieldEmpty:
            return "필수 입력 사항입니다"
        case .emailTextFieldValid:
            return "올바른 이메일 형식입니다"
        case .emailTextFieldInvalid:
            return "잘못된 이메일 형식입니다"
        case .passwordTextFieldDoubleCheckFalse:
            return "비밀번호가 일치하지 않습니다"
        case .nicknameTextFieldOver:
            return "2~5자내로 입력해주세요"
        case .nicknameTextFieldDoubleCheck:
            return "중복확인을 진행해주세요"
        case .nicknameTextFieldDuplicated:
            return "중복된 닉네임입니다."
        case .nicknameTextFieldValid:
            return "사용가능한 닉네임입니다"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .textFieldEmpty, .emailTextFieldInvalid, .passwordTextFieldDoubleCheckFalse, .nicknameTextFieldOver, .nicknameTextFieldDuplicated, .nicknameTextFieldDoubleCheck:
            return .red
        case .emailTextFieldValid, .nicknameTextFieldValid:
            return .gray400
        }
    }
}
