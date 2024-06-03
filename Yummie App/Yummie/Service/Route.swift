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
    case placeOrder(String)
    case fetchOrders
    
    var description: String {
        
        switch self {
        case .fetchAllFoods:
            return "/dish-categories"
        case.fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchOrders:
            return "/orders"
        }
    }
}
