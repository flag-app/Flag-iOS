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

extension FriendPlusAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
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
