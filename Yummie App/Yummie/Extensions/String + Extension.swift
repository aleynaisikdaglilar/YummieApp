//
//  String + Extension.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 1.05.2024.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
