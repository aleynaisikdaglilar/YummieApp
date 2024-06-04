//
//  PopularDishesCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 3.03.2024.
//

import UIKit

final class PopularDishesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularDishesCollectionViewCell"
    
    let cardView = CustomCardView()

    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var popularTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.cornerRadius = 5
        return imageView
    }()
    
    private lazy var popularCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var popularDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    private func prepareUI() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(stackViewVertical)
        cardView.addSubview(popularTitleLabel)
        cardView.addSubview(popularImageView)
        cardView.addSubview(popularCaloriesLabel)
        cardView.addSubview(popularDescLabel)
        
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 290),
            cardView.widthAnchor.constraint(equalToConstant: 180),
            
            stackViewVertical.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            stackViewVertical.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            stackViewVertical.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            stackViewVertical.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            
            popularTitleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor),
            popularTitleLabel.centerXAnchor.constraint(equalTo: stackViewVertical.centerXAnchor),
            
            popularImageView.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor),
            popularImageView.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor),
            popularImageView.topAnchor.constraint(equalTo: popularTitleLabel.bottomAnchor, constant: 6),
            popularImageView.heightAnchor.constraint(equalToConstant: 200),
           
            popularCaloriesLabel.topAnchor.constraint(equalTo: popularImageView.bottomAnchor, constant: 8),
            popularCaloriesLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor),
           
            popularDescLabel.topAnchor.constraint(equalTo: popularCaloriesLabel.bottomAnchor, constant: 8),
            popularDescLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor),
            popularDescLabel.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor)
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(popular: PopularsSpecials) {
        popularTitleLabel.text = popular.name
        popularImageView.kf.setImage(with: popular.image?.asURL)
        popularCaloriesLabel.text = popular.formattedCalories
        popularDescLabel.text = popular.description
    }

}
