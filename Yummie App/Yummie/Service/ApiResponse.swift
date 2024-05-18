//
//  ApiResponse.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 13.05.2024.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
