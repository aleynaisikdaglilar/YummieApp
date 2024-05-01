//
//  PlaceOrderViewController.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit

class PlaceOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        //        let appearance = UINavigationBarAppearance()
        //        appearance.configureWithTransparentBackground()
        //        navigationItem.standardAppearance = appearance
        //        navigationItem.compactAppearance = appearance
        //        navigationItem.scrollEdgeAppearance = appearance
        //        navigationItem.largeTitleDisplayMode = .never
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(backAction))
//        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SRESESGS", style: .plain, target: nil, action: nil)
        
        
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
    
    @objc func backAction() {
//        navigationController?.popViewController(animated: true)
//        print("BACKBACKBACK")
//        navigationController?.pushViewController(FoodListViewController(), animated: true)
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
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCaloriesTableViewCell.identifier, for: indexPath) as! TitleCaloriesTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
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
