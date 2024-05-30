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
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 290).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        stackViewVertical.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        stackViewVertical.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        stackViewVertical.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        stackViewVertical.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8).isActive = true
        
        popularTitleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor).isActive = true
        popularTitleLabel.centerXAnchor.constraint(equalTo: stackViewVertical.centerXAnchor).isActive = true
        
        popularImageView.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
        popularImageView.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor).isActive = true
        popularImageView.topAnchor.constraint(equalTo: popularTitleLabel.bottomAnchor, constant: 6).isActive = true
        popularImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
       
        popularCaloriesLabel.topAnchor.constraint(equalTo: popularImageView.bottomAnchor, constant: 8).isActive = true
        popularCaloriesLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
       
        popularDescLabel.topAnchor.constraint(equalTo: popularCaloriesLabel.bottomAnchor, constant: 8).isActive = true
        popularDescLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
        popularDescLabel.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor).isActive = true
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
