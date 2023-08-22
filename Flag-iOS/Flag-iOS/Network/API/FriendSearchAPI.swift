//
//  FriendSearchAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

import Moya

enum FriendSearchAPI {
    case friendSearch(body: FriendSearch)
}

extension FriendSearchAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
    var path: String {
        switch self {
        case .friendSearch:
            return "/friends/List"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .friendSearch:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .friendSearch(let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String : String]? {
            return [
                "Content-type": "application/json",
                "Authorization":
                    """
               eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvb0BuYXZlci5jb20iLCJyb2xlcyI6W10sImlhdCI6MTY5MjU2Mjc5MywiZXhwIjoxNjk1MTU0NzkzfQ.OadrHpnjbqTCxRSvcSLQyxbJRe49XF-0I7yChSIp6R4
"""
            ]
        }
}

