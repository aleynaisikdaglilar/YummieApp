//
//  ChefsSpecialsTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 5.04.2024.
//

import UIKit

protocol ChefsSpecialsTableViewCellDelegate: AnyObject {
    func didSelectItem(_ popularSpecials: PopularsSpecials)
}

class ChefsSpecialsTableViewCell: UITableViewCell {
    
    private enum Constant {
        static let backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        static let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    static let identifier = "ChefsSpecialsTableViewCell"
    
    private var specials: [PopularsSpecials] = []
    weak var delegate: ChefsSpecialsTableViewCellDelegate?
    
    let titleLabel = TitleLabel( customText: "Chef's Specials")
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var chefsSpecialsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ChefsSpecialsCollectionViewCell.self, forCellWithReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier)
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
        contentView.addSubview(chefsSpecialsCollectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            chefsSpecialsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            chefsSpecialsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            chefsSpecialsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            chefsSpecialsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        prepareUI()
    }
    
    func configure(with specials: [PopularsSpecials]) {
        self.specials = specials
        chefsSpecialsCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChefsSpecialsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier, for: indexPath) as! ChefsSpecialsCollectionViewCell
        cell.configure(specials: specials[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let specials = specials[indexPath.item]
        delegate?.didSelectItem(specials)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: 100)
        
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
