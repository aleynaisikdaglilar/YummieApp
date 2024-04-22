////
////  HomeViewController.swift
////  Yummie
////
////  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 26.02.2024.
////
//
//// collectionview - view bacgrounc .clear
////  return CGSize(width: 150, height: 56)
//// tableview - sectionview - başlıklar
//import UIKit
//
//class HomeViewController: UIViewController {
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 18, weight: .medium)
//        label.numberOfLines = 0
//        label.text = "Yummie"
//        return label
//    }()
//    
//    private lazy var rightButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(systemName: "cart.circle.fill"), for: .normal)
//        button.tintColor = .red
//        //        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
//        return button
//    }()
//    
//    private lazy var scrollView: UIScrollView = {
//        let sv = UIScrollView()
//        //                sv.backgroundColor = .systemRed
//        sv.translatesAutoresizingMaskIntoConstraints = false
//        return sv
//    }()
//    
//    private lazy var stackViewVertical: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = NSLayoutConstraint.Axis.vertical
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 0
//        stackView.alignment = .fill
//        stackView.layer.masksToBounds = true
//        stackView.isLayoutMarginsRelativeArrangement = true
////        stackView.backgroundColor = .yellow
//        return stackView
//    }()
//    
//    private lazy var viewInsideFirst: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .systemPink
//        return view
//    }()
//    
//    private lazy var viewInsideSecond: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .orange
//        return view
//    }()
//    
//    private lazy var viewInsideThird: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .systemBlue
//        return view
//    }()
//    
//    private lazy var labelFirst: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Food Category"
//        label.textColor = .darkGray
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        return label
//    }()
//    
//    private lazy var labelSecond: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Popular Dishes"
//        label.textColor = .darkGray
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        return label
//    }()
//    
//    private lazy var labelThird: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Chef's Specials"
//        label.textColor = .darkGray
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        return label
//    }()
//    
//    private lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        return layout
//    }()
//    
//    private lazy var categoryCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
////        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
//    
//    private lazy var popularCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
////        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
//    
//    private lazy var specialCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
////        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
//    
//    private func prepareUI() {
//        view.backgroundColor = .white
//        scrollView.addSubview(stackViewVertical)
//        scrollView.addSubview(viewInsideFirst)
//        scrollView.addSubview(labelFirst)
//        scrollView.addSubview(categoryCollectionView)
//        
//        scrollView.addSubview(viewInsideSecond)
//        scrollView.addSubview(labelSecond)
//        scrollView.addSubview(popularCollectionView)
//        
//        scrollView.addSubview(viewInsideThird)
//        scrollView.addSubview(labelThird)
//        scrollView.addSubview(specialCollectionView)
//        
//        view.addSubview(titleLabel)
//        view.addSubview(rightButton)
//        view.addSubview(scrollView)
//        
//        let safeGuide = self.view.safeAreaLayoutGuide
//        
//        titleLabel.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 20).isActive = true
//        
//        rightButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
//        rightButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
//        
//        scrollView.topAnchor.constraint(equalTo: rightButton.bottomAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        viewInsideFirst.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        viewInsideFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        viewInsideFirst.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        viewInsideFirst.heightAnchor.constraint(equalToConstant: 220).isActive = true
//        
//        labelFirst.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
//        labelFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
//        
//        viewInsideSecond.topAnchor.constraint(equalTo: viewInsideFirst.bottomAnchor, constant: 30).isActive = true
//        viewInsideSecond.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        viewInsideSecond.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        viewInsideSecond.heightAnchor.constraint(equalToConstant: 350).isActive = true
//        
//        labelSecond.topAnchor.constraint(equalTo: viewInsideSecond.topAnchor, constant: 16).isActive = true
//        labelSecond.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
//        
//        viewInsideThird.topAnchor.constraint(equalTo: viewInsideSecond.bottomAnchor, constant: 30).isActive = true
//        viewInsideThird.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        viewInsideThird.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        viewInsideThird.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        
//        labelThird.topAnchor.constraint(equalTo: viewInsideThird.topAnchor, constant: 16).isActive = true
//        labelThird.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
//        
//        categoryCollectionView.topAnchor.constraint(equalTo: labelFirst.bottomAnchor, constant: 8).isActive = true
//        categoryCollectionView.leadingAnchor.constraint(equalTo: viewInsideFirst.leadingAnchor).isActive = true
//        categoryCollectionView.trailingAnchor.constraint(equalTo: viewInsideFirst.trailingAnchor).isActive = true
//        categoryCollectionView.bottomAnchor.constraint(equalTo: viewInsideFirst.bottomAnchor).isActive = true
//        
//        popularCollectionView.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 8).isActive = true
//        popularCollectionView.leadingAnchor.constraint(equalTo: viewInsideSecond.leadingAnchor).isActive = true
//        popularCollectionView.trailingAnchor.constraint(equalTo: viewInsideSecond.trailingAnchor).isActive = true
//        popularCollectionView.bottomAnchor.constraint(equalTo: viewInsideSecond.bottomAnchor).isActive = true
//        
//        specialCollectionView.topAnchor.constraint(equalTo: labelThird.bottomAnchor, constant: 8).isActive = true
//        specialCollectionView.leadingAnchor.constraint(equalTo: viewInsideThird.leadingAnchor).isActive = true
//        specialCollectionView.trailingAnchor.constraint(equalTo: viewInsideThird.trailingAnchor).isActive = true
//        specialCollectionView.bottomAnchor.constraint(equalTo: viewInsideThird.bottomAnchor).isActive = true
//        
//        stackViewVertical.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        stackViewVertical.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        stackViewVertical.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        stackViewVertical.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        stackViewVertical.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.5).isActive = true
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        view.backgroundColor = .blue
//        registerCells()
//        prepareUI()
//    }
//    
//    private func registerCells() {
//        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
//        popularCollectionView.register(PopularDishesCollectionViewCell.self, forCellWithReuseIdentifier: PopularDishesCollectionViewCell.identifier)
//        specialCollectionView.register(ChefsSpecialsCollectionViewCell.self, forCellWithReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier)
//    }
//}
//
//extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
////        return cell
//        switch collectionView {
//        case categoryCollectionView:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
//            return cell
//        case popularCollectionView:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCollectionViewCell.identifier, for: indexPath) as! PopularDishesCollectionViewCell
//            return cell
//        case specialCollectionView:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefsSpecialsCollectionViewCell.identifier, for: indexPath) as! ChefsSpecialsCollectionViewCell
//            return cell
//        default:
//            return UICollectionViewCell()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: 150, height: 56)
//        switch collectionView {
//        case categoryCollectionView:
//            return CGSize(width: 150, height: 56)
//        case popularCollectionView:
//            return CGSize(width: 180, height: 300)
//        case specialCollectionView:
//            return CGSize(width: 330, height: 100)
//        default:
//            return CGSize(width: 150, height: 56)
//        }
//
//    }
//
//    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    //        return 2
//    //    }
//    //
////        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////            return 8
////        }
//}
