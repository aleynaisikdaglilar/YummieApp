//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 8.01.2024.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    private enum Constant {
        static let stackViewLayoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
//        static let subTitleLabelFontSize = INGFont(size: 22)
//        static let descriptionLabelFontSize = INGFont(size: 15)
        static let stackViewSpacing = CGFloat(10.0)
//        static let stackViewSetCustomSpacing = CGFloat(20.0)
    }
    
    static let identifier = "OnboardingCollectionViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.layer.masksToBounds = true
        stackView.spacing = Constant.stackViewSpacing
        stackView.layoutMargins = Constant.stackViewLayoutMargins
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 31, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private func prepareUI() {
        contentView.clipsToBounds = true
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(stackView)
        
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        stackView.setCustomSpacing(Constant.stackViewSetCustomSpacing, after: imageView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingCollectionViewCell {
    func configure(dataModel: OnboardingDataModel) {
        imageView.image = UIImage(named: dataModel.imageName)
        subTitleLabel.text = dataModel.title
        descriptionLabel.text = dataModel.description
    }
}


