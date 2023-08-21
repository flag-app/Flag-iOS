//
//  BaseTargetType.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType{
    
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var headers: [String : String]? {
        let accessToken = getTokenFromRealm()
        let header = [
            "Content-Type": "application/json",
            "Authorization": accessToken
        ]
        return header
    }
    
    var sampleData: Data {
        return Data()
    }
    
    func getTokenFromRealm() -> String {
        let realm = RealmService()
        return realm.getAccessToken()
    }
}
