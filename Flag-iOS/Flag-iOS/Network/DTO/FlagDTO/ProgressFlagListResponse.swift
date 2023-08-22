//
//  ProgressFlagListResponse.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

struct ProgressFlagListResponse: Codable {
    var id: Int
    var title: String
    var name: String?
    var place: String
    var host: String
    var count: Int
}
