//
//  OrdersListViewController.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 30.05.2024.
//

import UIKit
import SVProgressHUD

class OrdersListViewController: UIViewController {

    private enum Constant {
        static let backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    }
    
    var orders: [Order] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constant.backgroundColor
        tableView.register(OrdersCategoriesTableViewCell.self, forCellReuseIdentifier: OrdersCategoriesTableViewCell.identifier)
        return tableView
    }()
    
    private func prepareUI() {
        
        title = "Orders"
    
        view.backgroundColor = Constant.backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        SVProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        NetworkService.shared.fetchOrders { [weak self] result in
            switch result {
                
            case .success(let orders):
                SVProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                SVProgressHUD.showError(withStatus: error.localizedDescription)
            }
        }
    }
}

extension OrdersListViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrdersCategoriesTableViewCell.identifier, for: indexPath) as! OrdersCategoriesTableViewCell
        cell.configure(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PlaceOrderViewController()
        controller.selectedItem = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
