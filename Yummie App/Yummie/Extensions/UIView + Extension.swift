//
//  UIView + Extension.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 1.05.2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
