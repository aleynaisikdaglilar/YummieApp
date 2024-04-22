//
//  TitleLabel.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 1.04.2024.
//

import UIKit

class TitleLabel: UILabel {
    
    init(customText: String?) {
        super.init(frame: .zero)
        self.text = customText
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
