//
//  FriendListDTO.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

struct FriendList: Codable {
    let email: String
    let name: String
    let id: Int
    let existFriend: Bool
}
