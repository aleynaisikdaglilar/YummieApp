//
//  HomeViewController.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 26.02.2024.
//
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private enum Constant {
        static let backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constant.backgroundColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    @objc func ordersButtonAction() {
        let foodList = FoodListViewController()
        navigationController?.pushViewController(foodList, animated: true)
    }
    
    private func prepareUI() {
        title = "Yummie"
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .done, target: self, action: #selector(ordersButtonAction))
        rightButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = rightButton

        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = Constant.backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
    
        view.addSubview(tableView)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
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
        
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return 365
        } else {
            return 170
        }
    }
}
