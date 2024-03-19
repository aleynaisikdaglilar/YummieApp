//
//  LocalizableString.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 14.02.2024.
//

import Foundation

enum LocalizableString: String {
    case labelTitle
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "\(rawValue)", comment: "")
    }
}
