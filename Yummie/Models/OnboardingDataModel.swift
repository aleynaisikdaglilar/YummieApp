//
//  OnboardingDataModel.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 9.01.2024.
//

import Foundation

struct OnboardingDataModel {
    
    let imageName: String
    let title: String
    let description: String
    
    init(imageName: String, title: String, description: String) {
        self.imageName = imageName
        self.title = title
        self.description = description
    }
}
