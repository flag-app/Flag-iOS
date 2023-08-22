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
    //리스트에서 확정 api
    case flagCandidateFix(flagId: Int)
}

extension FlagListAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
    var path: String {
        switch self {
        case .showFlagList(let flagId):
            return "/flag/\(flagId)/candidate"
        case .flagCandidateFix(let flagId):
            return "/flag/\(flagId)/candidate/fix"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showFlagList:
            return .get
        case .flagCandidateFix:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .showFlagList:
            return .requestPlain
        case .flagCandidateFix(let body):
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

