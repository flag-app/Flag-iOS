//
//  ProgressFlagListResponse.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

struct ProgressFlagListResponse: Codable {
    var check: Bool
    var count: Int
    var host: String
    var id: Int
    var name: String?
    var place: String
    var role: String
    var title: String
}
