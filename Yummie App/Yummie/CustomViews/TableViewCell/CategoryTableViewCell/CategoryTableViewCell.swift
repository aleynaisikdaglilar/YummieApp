//
//  CategoryTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 31.03.2024.
//

import UIKit

protocol CategoryTableViewCellDelegate: AnyObject {
    func didSelectItem(_ category: Category)
}

class CategoryTableViewCell: UITableViewCell {
    
    private enum Constant {
        static let backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        static let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    static let identifier = "CategoryTableViewCell"
    
    private var categories: [Category] = []
    var dishes: [PopularsSpecials] = []
    
    weak var delegate: CategoryTableViewCellDelegate?
    
    let titleLabel = TitleLabel( customText: "Food Category")
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = Constant.backgroundColor
        collectionView.contentInset = Constant.contentInset
        return collectionView
    }()
    
    private func prepareUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryCollectionView)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        categoryCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        categoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        prepareUI()
    }
    
    func configure(with categories: [Category]) {
        self.categories = categories
        categoryCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(category: categories[indexPath.row])
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150, height: 56)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categories = categories[indexPath.item]
        delegate?.didSelectItem(categories)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            // Return the minimum spacing between lines in the collection view.
            return 20 // Adjust as needed
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            // Return the minimum spacing between items in the same row.
            return 20 // Adjust as needed
        }
}
