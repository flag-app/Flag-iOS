//
//  FlagListAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/22.
//

import Foundation

import Moya

enum FlagListAPI {
    case showFlagList(flagId: Int)
}

extension FlagListAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
    var path: String {
        switch self {
        case .showFlagList(let flagId):
            return "/flag/\(flagId)/candidate"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showFlagList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .showFlagList:
            return .requestPlain
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

