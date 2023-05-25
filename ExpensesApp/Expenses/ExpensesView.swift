//
//  ExpensesView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 16/05/23.
//

import UIKit

class ExpensesView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = " Nome"
        text.backgroundColor = .white
        text.layer.cornerRadius = 8
        return text
    }()
    
    lazy var valueTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = " Valor"
        text.backgroundColor = .white
        text.keyboardType = .numberPad
        text.layer.cornerRadius = 8
        return text
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        stack.addArrangedSubview(nameTextField)
        stack.addArrangedSubview(valueTextField)
        return stack
    }()
    
    private func setup(){
        addSubview(nameTextField)
        addSubview(valueTextField)
        addSubview(stack)
    }
    

    
    private func layout(){
        NSLayoutConstraint.activate([
        
        stack.topAnchor.constraint(equalTo: self.topAnchor),
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        nameTextField.heightAnchor.constraint(equalToConstant: 44),
        valueTextField.heightAnchor.constraint(equalToConstant: 44)
        
    ])
    }
    
    
}
