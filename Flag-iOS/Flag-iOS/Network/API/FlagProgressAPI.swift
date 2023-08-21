//
//  FlagProgressAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

import Moya

enum FlagProgressAPI {
    case showProgress(flagId: Int)
    case selectTimeCell(flagId: Int,cellIndex: Int)
}

extension FlagProgressAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
    var path: String {
        switch self {
        case .showProgress(let flagId):
            return "/flag/\(flagId)/show"
        case .selectTimeCell(let flagId, let cellIndex):
            return "/flag/\(flagId)/\(cellIndex)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showProgress:
            return .get
        case .selectTimeCell:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .showProgress:
            return .requestPlain
        case .selectTimeCell:
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

