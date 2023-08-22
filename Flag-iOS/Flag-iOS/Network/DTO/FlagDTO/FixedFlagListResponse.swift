//
//  FixedFlagListDTO.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/23.
//

import Foundation

struct FixedFlagListResponse: Codable {
    let date: String
    let endTime: String
    let members: [String]
    let memo: String
    let name: String
    let place: String
    let startTime: String
}
