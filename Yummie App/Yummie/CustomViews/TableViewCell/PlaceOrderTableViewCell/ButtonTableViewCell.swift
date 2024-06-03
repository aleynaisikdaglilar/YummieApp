//
//  ButtonTableViewCell.swift
//  Yummie
//
//  Created by Aleyna Işıkdağlılar on 16.04.2024.
//

import UIKit
import SVProgressHUD

protocol ButtonTableViewCellDelegate: AnyObject {
    func buttonTableViewCellDidTapButton(_ cell: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    
    static let identifier = "ButtonTableViewCell"
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Place Order", for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    @objc private func didTapButton(_ sender: UIButton) {
          delegate?.buttonTableViewCellDidTapButton(self)
      }
    
    private func prepareUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
