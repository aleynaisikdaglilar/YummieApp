//
//  OrdersCategoriesTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 25.04.2024.
//

import UIKit

class OrdersCategoriesTableViewCell: UITableViewCell {
    
    static let identifier = "OrdersCategoriesTableViewCell"
    
    let cardView = CustomCardView()
    
    private enum Constant {
        static let backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        static let imageCornerRadius = CGFloat(5)
        static let sVSpacing = CGFloat(8)
    }
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.cornerRadius = Constant.imageCornerRadius
        return imageView
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = Constant.sVSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private func prepareUI() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(image)
        cardView.addSubview(stackViewVertical)
        stackViewVertical.addSubview(titleLabel)
        stackViewVertical.addSubview(descLabel)
        
        contentView.backgroundColor = .clear
        
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        cardView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 82).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 288).isActive = true
        
        image.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        image.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 55).isActive = true
        image.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        stackViewVertical.topAnchor.constraint(equalTo: image.topAnchor).isActive = true
        stackViewVertical.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16).isActive = true
        stackViewVertical.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        stackViewVertical.bottomAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor, constant: 3).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 8).isActive = true
        
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 8).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: -8).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: PopularsSpecials) {
        image.kf.setImage(with: category.image?.asURL)
        titleLabel.text = category.name
        descLabel.text = category.description
    }
    
    func configure(order: Order) {
        image.kf.setImage(with: order.dish?.image?.asURL)
        titleLabel.text = order.dish?.name
        descLabel.text = order.name
    }
}
