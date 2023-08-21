//
//  FlagPlusDTO.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

struct FlagPlus: Codable {
    let name: String
    let dates: [String]
    let guestNames: [String]
    let memo: String
    let minTime: Int
    let place: String
    let possibleDates: [Int]
    let timeSlot: Int
}
