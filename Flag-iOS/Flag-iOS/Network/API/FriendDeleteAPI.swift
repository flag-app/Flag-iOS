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

extension FriendDeleteAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
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



