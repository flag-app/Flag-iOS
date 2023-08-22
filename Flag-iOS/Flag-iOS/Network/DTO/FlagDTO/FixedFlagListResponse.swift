//
//  FixedFlagListDTO.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

struct FixedFlagListResponse: Codable {
    var count: Int
    var date: String
    var dday: String
    var endTime: String
    var host: String
    var id: Int
    var members: [String]
    var memo: String
    var name: String
    var place: String
    var startTime: String
    var title: String
}

