//
//  GenericResponse.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

struct GenericResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
