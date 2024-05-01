//
//  HomeViewController.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar [Ing Teknoloji A.S.-Tuzel Bankacilik Dijital Squad 1] on 26.02.2024.
//
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.text = "Yummie"
        return label
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "cart.circle.fill"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(ordersButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return tableView
    }()
    
    @objc func ordersButtonAction() {
    
        
        let navigationController = UINavigationController()
        let foodList = FoodListViewController()
        navigationController.pushViewController(foodList, animated: true)
        present(navigationController, animated: true, completion: nil)
        
        
//        let nav = UINavigationController()
//        let food = FoodListViewController()
//        navigationController?.viewControllers = [food]
//        
//        nav.navigationBar.barTintColor = .systemBlue
//        nav.navigationBar.tintColor = .white
//        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        present(nav, animated: true, completion: nil)
        
        
        
//        print("BACKBACKBACK")
//        let food = FoodListViewController()
//        self.present(food, animated: true, completion: nil)
//        navigationController?.pushViewController(food, animated: true)
        
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        self.view.window?.layer.add(transition, forKey: kCATransition)
//        present(food, animated: false, completion: nil)
    }
    
    private func prepareUI() {
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(titleLabel)
        view.addSubview(rightButton)
        view.addSubview(tableView)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        titleLabel.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: rightButton.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        prepareUI()
    }
    
    private func registerCells() {
        
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(ChefsSpecialsTableViewCell.self, forCellReuseIdentifier: ChefsSpecialsTableViewCell.identifier)
        tableView.register(PopularDishesTableViewCell.self, forCellReuseIdentifier: PopularDishesTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        //        / Replace yourDataArray with your actual data array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularDishesTableViewCell.identifier, for: indexPath) as! PopularDishesTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChefsSpecialsTableViewCell.identifier, for: indexPath) as! ChefsSpecialsTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return different row heights based on indexPath or any other condition
        if indexPath.row == 0 {
            return 200 // Height for the first row
        } else if indexPath.row == 1 {
            return 400 // Height for the second row
        } else {
            return 200 // Default height for other rows
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            print("BASTIMMM")
        }
//        let placeOrderViewController = PlaceOrderViewController()
//        navigationController?.pushViewController(placeOrderViewController, animated: true)
    }
}
