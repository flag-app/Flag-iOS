//
//  OnboardingNicknameTextFieldResultType.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/31.
//

import Foundation

enum OnboardingNicknameTextFieldResultType {
    case nicknameTextFieldEmpty
    case nicknameTextFieldOver
    case nicknameTextFieldDuplicated
    case nicknameTextFieldValid
    
    var errorMessage: String {
        switch self {
        case .nicknameTextFieldEmpty:
            return "닉네임을 입력해주세요"
        case .nicknameTextFieldOver:
            return "2~5자내로 입력해주세요"
        case .nicknameTextFieldDuplicated:
            return "중복된 닉네임입니다."
        case .nicknameTextFieldValid:
            return "사용가능한 닉네임입니다"
        }
    }
}
