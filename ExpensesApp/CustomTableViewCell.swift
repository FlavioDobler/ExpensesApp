//
//  CustomCellTableViewCell.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 10/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let indentifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(containerView)
        addSubview(symbolLabel)
        addSubview(totalSymbolLabel)
        addSubview(totalPriceLabel)
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(progressBar)
        addSubview(lineView)
        layout()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    let containerView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var symbolLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1)
        return label
    }()
    
    lazy var totalSymbolLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.54, green: 0.566, blue: 0.8, alpha: 1)
        return label
    }()
    
    lazy var productLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1)
        return label
    }()
    
    lazy var totalPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.54, green: 0.566, blue: 0.8, alpha: 1)
        return label
    }()
    
    lazy var progressBar : UIProgressView = {
        let pview = UIProgressView()
        pview.translatesAutoresizingMaskIntoConstraints = false
        pview.tintColor = .blue
        pview.trackTintColor = .lightGray
        pview.layer.cornerRadius = 10
        return pview
    }()
    
    lazy var lineView : UIView = {
        let lview = UIView()
        lview.translatesAutoresizingMaskIntoConstraints = false
        lview.layer.cornerRadius = 6
        lview.backgroundColor = .gray
        lview.layer.borderWidth = 1
        return lview
    }()
    
    var product : ProductModel? {
        didSet {
            guard let productItem = product else {return }
            
            if let name = productItem.name {
                productLabel.text = name
            }
            
            if let symbol = productItem.cashSymbol{
                symbolLabel.text = symbol
            }
                
            if let totalSymbol = productItem.totalValueCashSymbol {
                totalSymbolLabel.text = totalSymbol
            }
            
            if let totalValue = productItem.totalValue {
                totalPriceLabel.text = totalValue
            }
            
            if let value = productItem.paidPrice {
                priceLabel.text = value
            }
            
            let initialProgressValue = (priceLabel.text! as NSString).floatValue
            let finalProgressValue = (totalPriceLabel.text! as NSString).floatValue
            progressBar.progress = initialProgressValue / finalProgressValue
        }
    }
    
    
    func layout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            productLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 6),
            productLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -240),
            productLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -39),
            
            progressBar.topAnchor.constraint(equalTo: productLabel.bottomAnchor,constant: 3),
            progressBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 4),
            progressBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            progressBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -30),

            symbolLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor,constant: 4),
            symbolLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            symbolLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -12),

            priceLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 2),
            priceLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor,constant: 4),
            priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -12),
            
            totalPriceLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor,constant: 4),
            totalPriceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -12),
            totalPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            totalSymbolLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor,constant: 4),
            totalSymbolLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -12),
            totalSymbolLabel.trailingAnchor.constraint(equalTo: totalPriceLabel.leadingAnchor,constant: -2)
        ])
    }
    
    
    
}
