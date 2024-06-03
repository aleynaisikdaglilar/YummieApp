//
//  PlaceOrderViewController.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit
import SVProgressHUD

class PlaceOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedItem: PopularsSpecials?
    var textFieldText: String?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return tableView
    }()
    
    private func registerCells() {
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.register(TitleCaloriesTableViewCell.self, forCellReuseIdentifier: TitleCaloriesTableViewCell.identifier)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
    }
    
    private func prepareUI() {
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        view.insetsLayoutMarginsFromSafeArea = false
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        prepareUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
            if let selectedItem = selectedItem {
                cell.configure(with: selectedItem.image ?? "")
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCaloriesTableViewCell.identifier, for: indexPath) as! TitleCaloriesTableViewCell
            if let selectedItem = selectedItem {
                cell.configure(with: selectedItem.name ?? "", calories: selectedItem.formattedCalories)
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
            if let selectedItem = selectedItem {
                cell.configure(with: selectedItem.description ?? "")
            }
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.configure(with: textFieldText)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 450 // Height for the first row
        }
        else if indexPath.row == 1 {
            return 50 // Height for the second row
        } else if indexPath.row == 2 {
            return 180
        } else if indexPath.row == 3 {
            return 80
        } else {
            return 50 // Default height for other rows
        }
    }
}

extension PlaceOrderViewController: ButtonTableViewCellDelegate {
    func buttonTableViewCellDidTapButton(_ cell: ButtonTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell),
           let textFieldCell = tableView.cellForRow(at: IndexPath(row: 3, section: indexPath.section)) as? TextFieldTableViewCell {
            
            guard let name = textFieldCell.textField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
                SVProgressHUD.showError(withStatus: "Please enter your name")
                return
            }
            
            SVProgressHUD.show(withStatus: "Placing Order...")
            NetworkService.shared.placeOrder(dishId: selectedItem?.id ?? "", name: name) { [self] result in
                print(selectedItem?.id, self.selectedItem?.name, name)
                switch result {
                case .success(_):
                    SVProgressHUD.showSuccess(withStatus: "Your order has been received. 👩🏻‍🍳")
                case .failure(let error):
                    SVProgressHUD.showError(withStatus: error.localizedDescription)
                }
            }
        }
    }
}
