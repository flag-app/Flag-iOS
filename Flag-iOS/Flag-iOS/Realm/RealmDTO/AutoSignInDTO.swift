//
//  AutoSignInDTO.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

import RealmSwift

final class AutoSignInDTO: Object {
    
    @Persisted var isSignedIn: Bool?
    
    @Persisted(primaryKey: true) var id: ObjectId
    
    override static func primaryKey() -> String? {
        return "RealmStoragePost"
    }
    
    convenience init(input: Bool) {
        self.init()
        
        self.isSignedIn = input
    }
}
