//
//  CustomCardView.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 2.04.2024.
//

import UIKit

class CustomCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.cornerRadius = 10
        backgroundColor = UIColor.white
        cornerRadius = 10
    }
}
