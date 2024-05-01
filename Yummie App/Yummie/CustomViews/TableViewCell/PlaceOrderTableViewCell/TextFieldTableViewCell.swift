//
//  TextFieldTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    static let identifier = "TextFieldTableViewCell"
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.borderStyle = .roundedRect
        text.textAlignment = .natural
        text.placeholder = "Enter your name"
        return text
    }()
    
    private func prepareUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(textField)
        
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
