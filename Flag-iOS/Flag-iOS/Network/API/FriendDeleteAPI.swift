//
//  FriendDeleteAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

import Moya

enum FriendDeleteAPI {
    case friendDelete(body: String)
}

extension FriendDeleteAPI: BaseTargetType {
   
    
    var path: String {
        switch self {
        case .friendDelete:
            return "/friends/delete"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .friendDelete:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .friendDelete(let body):
            return .requestParameters(parameters: ["name" : body], encoding: URLEncoding.queryString)
        }
    }
    
}



