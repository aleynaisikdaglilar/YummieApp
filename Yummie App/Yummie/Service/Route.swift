//
//  Route.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 13.05.2024.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllFoods
    case fetchCategoryDishes(String)
    
    var description: String {
        
        switch self {
        case .fetchAllFoods:
            return "/dish-categories"
        case.fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        }
    }
}
