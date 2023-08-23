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
}

extension MyPageAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getNickname:
            return "/user/mypage"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNickname:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getNickname:
            return .requestPlain
        }
    }
}
