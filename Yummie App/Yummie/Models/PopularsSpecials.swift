//
//  PopularsSpecials.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 13.05.2024.
//

import Foundation

struct PopularsSpecials: Decodable {
    
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
