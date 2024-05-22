//
//  PopularDishesTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 6.04.2024.
//

//textlerin hizası - title ile arasındaki bosluk

import UIKit

class PopularDishesTableViewCell: UITableViewCell {
    
    static let identifier = "PopularDishesTableViewCell"
    
    private var populars: [PopularsSpecials] = []
    
    let titleLabel = TitleLabel( customText: "Popular Dishes")
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var popularDishesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PopularDishesCollectionViewCell.self, forCellWithReuseIdentifier: PopularDishesCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return collectionView
    }()
    
    private func prepareUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(popularDishesCollectionView)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        popularDishesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        popularDishesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        popularDishesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        popularDishesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        prepareUI()
    }
    
    func configure(with populars: [PopularsSpecials]) {
        self.populars = populars
        popularDishesCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularDishesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCollectionViewCell.identifier, for: indexPath) as! PopularDishesCollectionViewCell
        cell.configure(popular: populars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let placeOrderViewController = PlaceOrderViewController()
//        let navigationController = UINavigationController()
//        navigationController.pushViewController(placeOrderViewController, animated: true)
        
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
