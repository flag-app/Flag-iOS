//
//  FlagGuestAPI.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/24.
//

import Foundation

import Moya

enum FlagGuestAPI {
    case flagGuestScrollCell(flagId: Int, requestBody: GuestFlag)
}

extension FlagGuestAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .flagGuestScrollCell(let flagId, _):
            return "/flag/guest/\(flagId)/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .flagGuestScrollCell:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .flagGuestScrollCell(_, let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
}

