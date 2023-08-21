//
//  AccessTokenDTO.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

import RealmSwift

final class AccessTokenDTO: Object {
    
    @Persisted var accessToken: String // user의 accessToken
    
    // PK
    @Persisted(primaryKey: true) var id: ObjectId
        
    override static func primaryKey() -> String? {
        return "RealmStoragePost"
    }
    
    convenience init(inputToken: String) {
        self.init()
        
        self.accessToken = inputToken
    }
}
