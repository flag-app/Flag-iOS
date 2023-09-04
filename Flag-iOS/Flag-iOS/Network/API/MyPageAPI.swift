//
//  MyPageAPI.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/24.
//

import Foundation

import Moya

enum MyPageAPI {
    case getNickname
    case changeNickname(requestBody: String)
}

extension MyPageAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getNickname:
            return "/user/mypage"
        case .changeNickname:
            return "/user/nickname"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNickname:
            return .get
        case .changeNickname:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .getNickname:
            return .requestPlain
        case .changeNickname(let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
}
