//
//  MyPageResponse.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/24.
//

import Foundation

struct MyPageResponse: Codable {
    var email: String
    var friends: [String]
    var name: String
}
