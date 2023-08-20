//
//  FlagPlusAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

import Moya

enum FlagPlusAPI {
    case setFlag(body: FlagPlus)
}

extension FlagPlusAPI: TargetType {
    public var baseURL: URL {
            return URL(string: Config.baseURL)!
        }
    
    var path: String {
        switch self {
        case .setFlag:
            return "/flag/add"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .setFlag:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .setFlag(let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String : String]? {
            return [
                "Content-type": "application/json",
                "Authorization":
                    """
                eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkbGFsd2w3MjNAbmF2ZXIuY29tIiwicm9sZXMiOltdLCJpYXQiOjE2OTI1NjEwMzAsImV4cCI6MTY5NTE1MzAzMH0.nVwgWxRna124Lxgp4ny2Ii0wclStAZo8JWqlbcN63fE
"""
            ]
        }
}
