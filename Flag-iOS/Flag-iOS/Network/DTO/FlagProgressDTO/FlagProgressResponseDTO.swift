//
//  FlagProgressDTO.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

struct FlagProgress: Codable {
    let nonResponseUsers: [String]
    let acceptUsers: [String]
    let userTotalCount: Int
    let ableCells: [Int]
    let dates: [String]
    let timeSlot: Int
}

