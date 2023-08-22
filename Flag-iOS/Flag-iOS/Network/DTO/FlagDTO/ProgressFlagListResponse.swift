//
//  ProgressFlagListResponse.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

struct ProgressFlagListResponse: Codable {
    var count: Int
    var host: String
    var id: Int
    var name: String
    var place: String
    var title: String
}
