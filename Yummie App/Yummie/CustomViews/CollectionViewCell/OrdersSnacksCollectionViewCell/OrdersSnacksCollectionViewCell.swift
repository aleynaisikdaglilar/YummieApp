//
//  OrdersSnacksCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 25.04.2024.
//

import UIKit

class OrdersSnacksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OrdersSnacksCollectionViewCell"
    
    let cardView = CustomCardView()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func prepareUI() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(imageView)
        
        contentView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 82).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 288).isActive = true
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
