//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 1.03.2024.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    let cardView = CustomCardView()
    
    private lazy var CategoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.text = "collection"
        return label
    }()

    private func prepareUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(CategoryImageView)
        cardView.addSubview(categoryTitleLabel)
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        CategoryImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        CategoryImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        CategoryImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        CategoryImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        categoryTitleLabel.centerYAnchor.constraint(equalTo: CategoryImageView.centerYAnchor).isActive = true
        categoryTitleLabel.leadingAnchor.constraint(equalTo: CategoryImageView.trailingAnchor, constant: 8).isActive = true
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
        // Initialization code
    }

}
