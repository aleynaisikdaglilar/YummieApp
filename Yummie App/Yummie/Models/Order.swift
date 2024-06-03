//
//  Order.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 30.05.2024.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: PopularsSpecials?
}
