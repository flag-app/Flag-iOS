//
//  AccessTokenDTO.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

import RealmSwift

final class AccessTokenDTO: Object {
    
    // user의 accessToken
    @Persisted var accessToken: String?
    
    // PK
    @Persisted(primaryKey: true) var id: ObjectId
        
    override static func primaryKey() -> String? {
        return "RealmStoragePost"
    }
    
    convenience init(input: String) {
        self.init()
        
        self.accessToken = input
    }
}
