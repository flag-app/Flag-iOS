//
//  FriendListAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

import Moya

enum FriendListAPI {
    case showFriendList
}

extension FriendListAPI: BaseTargetType {
    
    
    var path: String {
        switch self {
        case .showFriendList:
            return "/friends/friendList"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showFriendList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .showFriendList:
            return .requestPlain
        }
    }
    
}


