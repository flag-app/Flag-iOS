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
    case progressFlag
}

extension FlagMainAPI: BaseTargetType {

    var path: String {
        switch self {
        case .fixedFlag:
            return "/flag/fixedlist"
        case .progressFlag:
            return "/flag/progresslist"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fixedFlag, .progressFlag:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fixedFlag, .progressFlag:
            return .requestPlain
        }
    }

}
