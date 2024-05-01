//
//  PopularDishesCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 3.03.2024.
//

//desc sığmıyor text
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
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 1
        label.text = "title"
        return label
    }()
    
    private lazy var popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var popularCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        label.text = "calor"
        return label
    }()
    
    private lazy var popularDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "desc"
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
        cardView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        

//        w 110 h 200
        stackViewVertical.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        stackViewVertical.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        stackViewVertical.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        stackViewVertical.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8).isActive = true
        
        popularTitleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor, constant: 4).isActive = true
        popularTitleLabel.centerXAnchor.constraint(equalTo: stackViewVertical.centerXAnchor).isActive = true
        popularTitleLabel.bottomAnchor.constraint(equalTo: popularImageView.topAnchor).isActive = true
        
        popularImageView.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
        popularImageView.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor).isActive = true
        popularImageView.topAnchor.constraint(equalTo: popularTitleLabel.bottomAnchor, constant: 2).isActive = true
        popularImageView.bottomAnchor.constraint(equalTo: popularCaloriesLabel.topAnchor).isActive = true
        popularImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        popularCaloriesLabel.topAnchor.constraint(equalTo: popularImageView.bottomAnchor).isActive = true
        popularCaloriesLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
        popularCaloriesLabel.bottomAnchor.constraint(equalTo: popularDescLabel.topAnchor).isActive = true
        
        popularDescLabel.topAnchor.constraint(equalTo: popularCaloriesLabel.bottomAnchor).isActive = true
        popularDescLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor).isActive = true
        popularDescLabel.bottomAnchor.constraint(equalTo: stackViewVertical.bottomAnchor).isActive = true
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
