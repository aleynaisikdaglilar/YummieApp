//
//  ChefsSpecialsCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 12.03.2024.
//

import UIKit

final class ChefsSpecialsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ChefsSpecialsCollectionViewCell"
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 10
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 10
        view.cornerRadius = 10
        return view
    }()
    
    private lazy var specialsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
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
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.text = "des"
        return label
    }()
    
    private lazy var specialsCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        label.text = "cal"
        return label
    }()
    
    private func prepareUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(specialsImageView)
        cardView.addSubview(stackViewVertical)
        cardView.addSubview(specialsTitleLabel)
        cardView.addSubview(specialsDescLabel)
        cardView.addSubview(specialsCaloriesLabel)

        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        
        specialsImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        specialsImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        specialsImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        specialsImageView.widthAnchor.constraint(equalToConstant: 68).isActive = true
        
        stackViewVertical.topAnchor.constraint(equalTo: specialsImageView.topAnchor, constant: 8).isActive = true
        stackViewVertical.leadingAnchor.constraint(equalTo: specialsImageView.trailingAnchor, constant: 16).isActive = true
        stackViewVertical.bottomAnchor.constraint(equalTo: specialsImageView.bottomAnchor, constant: 8).isActive = true
        
        specialsTitleLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 8).isActive = true
        specialsTitleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor).isActive = true
        
        specialsDescLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 8).isActive = true
        specialsDescLabel.topAnchor.constraint(equalTo: specialsTitleLabel.bottomAnchor).isActive = true
        
        specialsCaloriesLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 8).isActive = true
        specialsCaloriesLabel.topAnchor.constraint(equalTo: specialsDescLabel.bottomAnchor).isActive = true
        
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
