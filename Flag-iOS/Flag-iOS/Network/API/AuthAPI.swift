//
//  AuthAPI.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/21.
//

import Foundation

import Moya

enum AuthAPI {
    case signUp(body: SignUpRequest)
    case signIn(body: SignInRequest)
}

extension AuthAPI: BaseTargetType {

    var path: String {
        switch self {
        case .signUp:
            return "/user/join"
        case .signIn:
            return "/user/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp, .signIn:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let body):
            return .requestJSONEncodable(body)
        case .signIn(let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
