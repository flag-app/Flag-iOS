//
//  FlagListResponseDTO.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/22.
//

import Foundation

struct FlagList: Codable {
    let date: String
    let candidates: [String]
    let timeSize: Int
    let endTime: String
    let startTime: String
}

