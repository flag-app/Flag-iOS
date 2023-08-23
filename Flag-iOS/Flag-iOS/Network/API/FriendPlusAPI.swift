//
//  FriendPlusAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

import Moya

enum FriendPlusAPI {
    case friendPlus(body: String)
}

extension FriendPlusAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .friendPlus:
            return "/friends/add"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .friendPlus:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .friendPlus(let body):
            return .requestParameters(parameters: ["friendName" : body], encoding: URLEncoding.queryString)
        }
    }
    
}
