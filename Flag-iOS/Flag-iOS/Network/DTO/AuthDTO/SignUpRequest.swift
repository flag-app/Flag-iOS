//
//  SignUpRequest.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/21.
//

import Foundation

struct SignUpRequest: Codable {
    var email: String
    var name: String
    var password: String
    var profile: String
    
    init(_ email: String, _ name: String, _ password: String) {
        self.email = email
        self.name = name
        self.password = password
        self.profile = ""
    }
}
