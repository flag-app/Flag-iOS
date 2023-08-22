//
//  FlagMainAPI.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

import Moya

enum FlagMainAPI {
    case fixedFlag
    case progressFlag
}

extension FlagMainAPI: BaseTargetType {
    public var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fixedFlag:
            return "/flag/fixedlist"
        case .progressFlag:
            return "/flag/progresslist"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fixedFlag, .progressFlag:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fixedFlag, .progressFlag:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let accessToken = """
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkbGFsd2w3MjNAbmF2ZXIuY29tIiwicm9sZXMiOltdLCJpYXQiOjE2OTI3MjcxNjgsImV4cCI6MTY5NTMxOTE2OH0.AhAysqEtqh6_VmEJOF3RZZI5OXzoS57NVeLkeaTUl7I
"""
        let header = [
            "Content-Type": "application/json",
            "Authorization": accessToken
        ]
        return header
    }
}
