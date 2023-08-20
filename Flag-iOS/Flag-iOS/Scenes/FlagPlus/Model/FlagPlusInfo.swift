//
//  FlagPlusInfo.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/21.
//

import Foundation

class FlagPlusInfo {
    static let shared = FlagPlusInfo()
    var name: String = ""
    var guestId: [String] = []
    var dates: [String] = []
    var timeSlot: Int = 0
    var minTime: Int = 0
    var place: String = ""
    var memo: String = ""
    var possibleDates: [Int] = []
    private init() { }
    
}
