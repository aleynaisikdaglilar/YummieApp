//
//  PopularDishDetailViewController.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 13.03.2024.
//

import UIKit

class PopularDishDetailViewController: UIViewController {
    
    private lazy var popularDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "slide1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var popularDetailTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 1
        label.text = "title"
        return label
    }()
    
    private lazy var popularDetailCaloriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 19, weight: .medium)
        label.numberOfLines = 1
        label.text = "title"
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var popularDetailDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.text = "deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj sdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfgh  aaaaaaaaaaaaa bbbbbbbbbbbbb ggggggggggggg fffffffffffffffff tttttttttttt uuuuuuuuuuuuu aaaaaaaaaaaa wwwwwwwwwwwww fghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj sdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfghjksdfghj deasdfghjks sdfgh  aaaaaaaaaaaaa bbbbbbbbbbbbb ggggggggggggg fffffffffffffffff tttttttttttt uuuuuuuuuuuuu aaaaaaaaaaaa wwwwwwwwww"
        return label
    }()
    
    private lazy var aaaaaa: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 19, weight: .medium)
        label.numberOfLines = 1
        label.text = "2345678"
        return label
    }()
    
    private lazy var popularDetailTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter your name"
        text.borderStyle = .roundedRect
//        text.font = UIFont.systemFont(ofSize: 15)
        return text
    }()
//    private lazy var stackViewVertical: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = NSLayoutConstraint.Axis.vertical
//        stackView.distribution = .fillEqually
//        stackView.spacing = 8
////        stackView.alignment = .fill
////        stackView.layer.masksToBounds = true
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.backgroundColor = .yellow
//        return stackView
//    }()
    
    private func prepareUI() {
        view.addSubview(popularDetailImageView)
        view.addSubview(popularDetailTitleLabel)
        view.addSubview(popularDetailCaloriesLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(popularDetailDescLabel)
        
        view.addSubview(aaaaaa)
        view.addSubview(popularDetailTextField)
//        view.addSubview(stackViewVertical)
        
        popularDetailImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        popularDetailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popularDetailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        popularDetailImageView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        
        popularDetailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        popularDetailTitleLabel.topAnchor.constraint(equalTo: popularDetailImageView.bottomAnchor).isActive = true
        
        popularDetailCaloriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        popularDetailCaloriesLabel.topAnchor.constraint(equalTo: popularDetailImageView.bottomAnchor).isActive = true
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: popularDetailTitleLabel.bottomAnchor, constant: 16).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: aaaaaa.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        popularDetailDescLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        popularDetailDescLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        popularDetailDescLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        popularDetailDescLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        popularDetailDescLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        aaaaaa.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        aaaaaa.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        aaaaaa.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        popularDetailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        popularDetailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//        popularDetailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popularDetailTextField.topAnchor.constraint(equalTo: aaaaaa.bottomAnchor).isActive = true
        popularDetailTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        aaaaaa.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        stackViewVertical.topAnchor.constraint(equalTo: popularDetailImageView.bottomAnchor, constant: 16).isActive = true
//        stackViewVertical.leadingAnchor.constraint(equalTo: popularDetailImageView.leadingAnchor, constant: 16).isActive = true
//        stackViewVertical.trailingAnchor.constraint(equalTo: popularDetailImageView.trailingAnchor, constant: -16).isActive = true
//        stackViewVertical.bottomAnchor.constraint(equalTo: popularDetailImageView.bottomAnchor, constant: -16).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareUI()
        
    }
}
