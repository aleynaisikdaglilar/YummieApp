//
//  ImageTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    static let identifier = "ImageTableViewCell"
    
    private lazy var Image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private func prepareUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(Image)
        
        Image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        Image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
