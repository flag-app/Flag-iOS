//
//  FriendSearchAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

import Moya

enum FriendsSearchAPI {
    case friendsSearch(body: String)
}

extension FriendsSearchAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .friendsSearch:
            return "/friends/List"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .friendsSearch:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .friendsSearch(let body):
            return .requestParameters(parameters: ["name": body], encoding: URLEncoding.queryString)
        }
    }
}

