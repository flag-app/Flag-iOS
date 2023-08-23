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
    case flagCandidateFix(flagId: Int, requestBody: Int)
}

extension FlagListAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .showFlagList(let flagId):
            return "/flag/\(flagId)/candidate"
        case .flagCandidateFix(let flagId, _):
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
        case .flagCandidateFix(_, let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
}
