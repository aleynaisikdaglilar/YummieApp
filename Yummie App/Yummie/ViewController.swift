//
//  ViewController.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 26.12.2023.
//

import UIKit


private extension OnboardingDataModel {
    
    static let PromoArray = [
        OnboardingDataModel(imageName: "slide2", title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world."),
        OnboardingDataModel(imageName: "slide1", title: "World-Class Chefs", description: "Our dishes are prepared by only the best."),
        OnboardingDataModel(imageName: "slide3", title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.")
    ]}

final class ViewController: UIViewController {
    private enum Constant {
        static let cancelButtonWidthAnchor = CGFloat(20)
        static let cancelButtonHeightAnchor = CGFloat(20)
        static let layoutSectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let connectToRemoteAdvButtonBackColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        static let connectToRemoteAdvButtonUIEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        static let pageControltransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        static let connectToRemoteAdvButtonborderWidth = CGFloat(1)
        static let connectToRemoteAdvButtoncornerRadius = CGFloat(8)
        static let cancelButtonImage = UIImage(named: "transactionDetailPopUpClose")
        static let stackViewLayoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        static let stackViewSpacing = CGFloat(10.0)
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = Constant.layoutSectionInset
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = OnboardingDataModel.PromoArray.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.numberOfPages = OnboardingDataModel.PromoArray.count
        pageControl.transform = Constant.pageControltransform
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = Constant.connectToRemoteAdvButtonBackColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.layer.masksToBounds = true
        stackView.spacing = Constant.stackViewSpacing
        stackView.layoutMargins = Constant.stackViewLayoutMargins
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isHidden = true
        return stackView
    }()

    @objc private func nextButtonAction() {
        let currentPage = getCurrentPage(collectionView)
        guard currentPage < OnboardingDataModel.PromoArray.count - 1 else {
            
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            let homeVC = HomeViewController()
            let navigationController = UINavigationController(rootViewController: homeVC)
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = true
            
            window.rootViewController = navigationController
            let options: UIView.AnimationOptions = .transitionFlipFromRight
            let duration: TimeInterval = 0.6
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { completed in })
            return
        }
        collectionView.scrollToItem(at: IndexPath(item: currentPage + 1, section: 0), at: .right, animated: true)
    }
    
    private func prepareUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -130).isActive = true
        
        pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        
        nextButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OnboardingDataModel.PromoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let promo = OnboardingDataModel.PromoArray[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(dataModel: promo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        nextButton.isEnabled = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollingFinished(scrollView: scrollView)
        //        let width = scrollView.frame.width
        //        currentPage = Int(scrollView.contentOffset.x / width)
        //        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = getCurrentPage(scrollView)
        pageControl.currentPage = currentPage
        
        if currentPage == (OnboardingDataModel.PromoArray.count - 1) {
            stackView.isHidden = false
            nextButton.setTitle("Get Started", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            scrollingFinished(scrollView: scrollView)
            return
        }
    }
    
    func scrollingFinished(scrollView: UIScrollView) {
        nextButton.isEnabled = true
    }
    
    private func getCurrentPage(_ scrollView: UIScrollView) -> Int {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        guard width != 0 else {
            return 0
        }
        return Int(offSet + horizontalCenter) / Int(width)
    }
}
