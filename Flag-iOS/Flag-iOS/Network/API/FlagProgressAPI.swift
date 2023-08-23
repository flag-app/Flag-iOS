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
    case userAcceptStatus(flagId: Int)
}

extension FlagProgressAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .showProgress(let flagId):
            return "/flag/\(flagId)/show"
        case .selectTimeCell(let flagId, let cellIndex):
            return "/flag/\(flagId)/\(cellIndex)"
        case .userAcceptStatus(let flagId):
            return "/flag/\(flagId)/checkState"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showProgress:
            return .get
        case .selectTimeCell:
            return .get
        case .userAcceptStatus:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .showProgress:
            return .requestPlain
        case .selectTimeCell:
            return .requestPlain
        case .userAcceptStatus:
            return .requestPlain
        }
    }
}

