//
//  BalanceView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 08/05/23.
//

import UIKit

class InfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setup() {
        addSubview(backgroundBalanceView)
        addSubview(balanceLabel)
        addSubview(lastAttLabel)
        addSubview(valueLabel)
        addSubview(timeLabel)
        addSubview(lineView)
        addSubview(symbolLabel)
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
        lazy var backgroundBalanceView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        return view
    }()
    
    
    lazy var balanceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Meu Saldo"
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        return label
    }()
    
    lazy var lastAttLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Última atualização"
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        return label
    }()
    
    lazy var symbolLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$"
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        return label
    }()
    
    
    lazy var valueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.000,00"
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        return label
    }()
    
    lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.text = "\(formatDate(date: Date()))"
        return label
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 322, height: 0)
        view.layer.borderWidth = 1
        return view
    }()
    
    
    func layout(){
        NSLayoutConstraint.activate([
                
            backgroundBalanceView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundBalanceView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundBalanceView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundBalanceView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            balanceLabel.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor,constant: 12),
            balanceLabel.leadingAnchor.constraint(equalTo: backgroundBalanceView.leadingAnchor,constant: 19),
            
            symbolLabel.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor,constant: 32),
            symbolLabel.leadingAnchor.constraint(equalTo: backgroundBalanceView.leadingAnchor,constant: 18),
            
            valueLabel.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor,constant: 32),
            valueLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor,constant: 2),
            
            lineView.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor ,constant: 76),
            
            lastAttLabel.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor,constant: 80),
            lastAttLabel.leadingAnchor.constraint(equalTo: backgroundBalanceView.leadingAnchor,constant: 18),
            
            
            timeLabel.topAnchor.constraint(equalTo: backgroundBalanceView.topAnchor,constant: 80),
            timeLabel.trailingAnchor.constraint(equalTo: backgroundBalanceView.trailingAnchor,constant: -12)
            
            
        
        
        
        
        
        ])
    }
    
}
