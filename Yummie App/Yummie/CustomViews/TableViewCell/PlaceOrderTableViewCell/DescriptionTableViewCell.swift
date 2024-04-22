//
//  DescriptionTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let identifier = "DescriptionTableViewCell"
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.text = "des"
        return label
    }()
    
    private func prepareUI() {
        contentView.addSubview(descriptionLabel)
        
//        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 668).isActive = true
//        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

