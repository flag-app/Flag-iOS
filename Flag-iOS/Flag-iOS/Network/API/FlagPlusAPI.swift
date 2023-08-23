//
//  FlagPlusAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

import Moya

enum FlagPlusAPI {
    case setFlag(body: FlagPlus)
}

extension FlagPlusAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .setFlag:
            return "/flag/add"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .setFlag:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .setFlag(let body):
            return .requestJSONEncodable(body)
        }
    }
}
