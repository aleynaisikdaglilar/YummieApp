//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 1.03.2024.
//

import UIKit
import Kingfisher

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    let cardView = CustomCardView()
    
    private lazy var CategoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 1
        return label
    }()

    private func prepareUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(CategoryImageView)
        cardView.addSubview(categoryTitleLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 56),
            cardView.widthAnchor.constraint(equalToConstant: 150),
            
            CategoryImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            CategoryImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            CategoryImageView.heightAnchor.constraint(equalToConstant: 40),
            CategoryImageView.widthAnchor.constraint(equalToConstant: 40),

            categoryTitleLabel.centerYAnchor.constraint(equalTo: CategoryImageView.centerYAnchor),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: CategoryImageView.trailingAnchor, constant: 8),
            categoryTitleLabel.widthAnchor.constraint(equalToConstant: 90)
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

    func configure(category: Category) {
        categoryTitleLabel.text = category.title
        CategoryImageView.kf.setImage(with: category.image?.asURL)
    }
}
