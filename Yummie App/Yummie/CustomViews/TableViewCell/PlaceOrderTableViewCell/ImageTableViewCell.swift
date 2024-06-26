//
//  ImageTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit
import Kingfisher

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
        
        NSLayoutConstraint.activate([
            Image.topAnchor.constraint(equalTo: contentView.topAnchor),
            Image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            Image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: String) {
        Image.kf.setImage(with: image.description.asURL)
    }
}
