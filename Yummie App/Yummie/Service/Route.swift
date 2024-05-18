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
    
    var description: String {
        
        switch self {
        case .fetchAllFoods:
            return "/dishes/cat1"
        }
    }
}
