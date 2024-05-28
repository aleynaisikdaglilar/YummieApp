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
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private func prepareUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with description: String) {
        descriptionLabel.text = description
    }
}

