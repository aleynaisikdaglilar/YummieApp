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
        
        

////        cornerRadius = 10
    }
}




































//import UIKit
//
//class CustomCardView: UIView {
//    
//    private lazy var categoryImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.masksToBounds = true
//        return imageView
//    }()
//    
//    private lazy var categoryTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 13, weight: .medium)
//        label.numberOfLines = 0
//        label.text = "cardview"
//        return label
//    }()
//    
//    var title: String? {
//        get { return categoryTitleLabel.text }
//        set { categoryTitleLabel.text = newValue }
//    }
//    
//    var image: UIImage? {
//        get { return categoryImageView.image }
//        set { categoryImageView.image = newValue }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//        
//        
////        addSubview(categoryTitleLabel)
////        addSubview(categoryImageView)
////        
////        categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
////        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
////        categoryImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
////        categoryImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        
////        categoryTitleLabel.centerYAnchor.constraint(equalTo: CategoryImageView.centerYAnchor).isActive = true
////        categoryTitleLabel.leadingAnchor.constraint(equalTo: CategoryImageView.trailingAnchor, constant: 8).isActive = true
//    }
//    
//}
