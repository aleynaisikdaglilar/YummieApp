//
//  HomeViewController.swift
//  Yummie
//
//  Created by Aleyna Isikdaglilar on 26.02.2024.
//
import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {
    
    var categories: [Category] = []
    var populars: [PopularsSpecials] = []
    var specials: [PopularsSpecials] = []
    
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
        let ordersList = OrdersListViewController()
        navigationController?.pushViewController(ordersList, animated: true)
    }
    
    private func prepareUI() {
        title = "Yummie"
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .done, target: self, action: #selector(ordersButtonAction))
        rightButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = rightButton
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = Constant.backgroundColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = Constant.backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        prepareUI()
        
        SVProgressHUD.show()
        NetworkService.shared.fetchAllFoods { [weak self] result in
            switch result {
            case .success(let allFoods):
                SVProgressHUD.dismiss()
                self?.categories = allFoods.categories ?? []
                self?.populars = allFoods.populars ?? []
                self?.specials = allFoods.specials ?? []
                
                self?.tableView.reloadData()
            case .failure(let error):
                SVProgressHUD.showError(withStatus: error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(ChefsSpecialsTableViewCell.self, forCellReuseIdentifier: ChefsSpecialsTableViewCell.identifier)
        tableView.register(PopularDishesTableViewCell.self, forCellReuseIdentifier: PopularDishesTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.configure(with: categories)
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularDishesTableViewCell.identifier, for: indexPath) as! PopularDishesTableViewCell
            cell.configure(with: populars)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChefsSpecialsTableViewCell.identifier, for: indexPath) as! ChefsSpecialsTableViewCell
            cell.configure(with: specials)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 190
        } else if indexPath.row == 1 {
            return 365
        } else {
            return 170
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: PopularDishesTableViewCellDelegate, ChefsSpecialsTableViewCellDelegate, CategoryTableViewCellDelegate {
   
    func didSelectItem(_ category: Category) {
        let list = FoodListViewController()
        list.selectedItem = category
        navigationController?.pushViewController(list, animated: true)
    }
    
    func didSelectItem(_ popularSpecials: PopularsSpecials) {
        let placeOrder = PlaceOrderViewController()
        placeOrder.selectedItem = popularSpecials
        navigationController?.pushViewController(placeOrder, animated: true)
    }
}
