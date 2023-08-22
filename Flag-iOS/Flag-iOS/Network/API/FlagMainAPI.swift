//
//  FlagMainAPI.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

import Moya

enum FlagMainAPI {
    case fixedFlag
}

extension FlagMainAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .fixedFlag:
            return "/flag/fixedlist"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fixedFlag:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fixedFlag:
            return .requestPlain
        }
    }
}
