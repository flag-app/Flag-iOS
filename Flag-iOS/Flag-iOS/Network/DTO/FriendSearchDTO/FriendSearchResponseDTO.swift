//
//  FriendSearchResponseDTO.swift
//  Flag-iOS
//
//  Created by 성현주 on 2023/08/23.
//

import Foundation

struct UserResponse: Codable {
    let id: Int
    let name: String
    let email: String
    let existFriend: Bool
}

struct FriendSearchResponse: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    //let result: String
}


//{
//  "code": 0,
//  "isSuccess": true,
//  "message": "string",
//  "result": "string"
//}
