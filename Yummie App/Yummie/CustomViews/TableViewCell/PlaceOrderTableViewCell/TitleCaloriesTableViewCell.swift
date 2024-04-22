//
//  TitleCaloriesTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit

class TitleCaloriesTableViewCell: UITableViewCell {

    static let identifier = "TitleCaloriesTableViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
//        stackView.spacing = 10.0
//        stackView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
//        stackView.layer.shadowColor = UIColor.black.cgColor
//        stackView.layer.shadowOpacity = 0.3
//        stackView.layer.shadowRadius = 6
//        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 1
        label.text = "title"
        return label
    }()
    
    private lazy var caloriesLabel: UILabel = {
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(caloriesLabel)
        contentView.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 618).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
