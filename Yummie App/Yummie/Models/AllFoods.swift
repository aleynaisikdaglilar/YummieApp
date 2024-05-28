//
//  AllFoods.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 13.05.2024.
//

import Foundation

struct AllFoods: Decodable {
    
    let categories: [Category]?
    let populars: [PopularsSpecials]?
    let specials: [PopularsSpecials]?
}
