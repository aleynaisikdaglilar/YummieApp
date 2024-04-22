//
//  ChefsSpecialsCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 12.03.2024.
//

import UIKit

final class ChefsSpecialsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ChefsSpecialsCollectionViewCell"
    
    let cardView = CustomCardView()
    
    private lazy var specialsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
//        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
//        stackView.alignment = .fill
//        stackView.layer.masksToBounds = true
        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private lazy var specialsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 1
        label.text = "title"
        return label
    }()
    
    private lazy var specialsDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.text = "des"
        return label
    }()
    
    private lazy var specialsCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        label.text = "cal"
        return label
    }()
    
    private func prepareUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(specialsImageView)
        cardView.addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(specialsTitleLabel)
        stackViewVertical.addArrangedSubview(specialsDescLabel)
        stackViewVertical.addArrangedSubview(specialsCaloriesLabel)
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        
        specialsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        specialsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        specialsImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        specialsImageView.widthAnchor.constraint(equalToConstant: 68).isActive = true
        
        stackViewVertical.topAnchor.constraint(equalTo: specialsImageView.topAnchor).isActive = true
        stackViewVertical.leadingAnchor.constraint(equalTo: specialsImageView.trailingAnchor, constant: 16).isActive = true
        stackViewVertical.bottomAnchor.constraint(equalTo: specialsImageView.bottomAnchor).isActive = true
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
