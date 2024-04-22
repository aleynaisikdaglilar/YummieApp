//
//  UIView+Extensions.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 27.01.2024.
//

import UIKit

extension UIView {
    var cornerRadius: CGFloat {
        get { return cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
