//
//  RevenueView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 18/05/23.
//

import UIKit

class RevenueView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
        picker.delegate = self
        picker.dataSource = self
        categoryTextField.delegate = self
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let picker = UIPickerView()
    let products = Product.getProducts()
    lazy var names = products.map{$0.name}
    
    
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
        text.layer.cornerRadius = 8
        text.keyboardType = .numberPad
        return text
    }()
    
    lazy var categoryTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = " Categoria"
        text.inputView = picker
        text.backgroundColor = .white
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
        stack.addArrangedSubview(categoryTextField)
        return stack
    }()
    
    
    private func setup(){
        addSubview(nameTextField)
        addSubview(valueTextField)
        addSubview(categoryTextField)
        addSubview(stack)
        
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
        
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            valueTextField.heightAnchor.constraint(equalToConstant: 44),
            categoryTextField.heightAnchor.constraint(equalToConstant: 44)
            
        
        ])
    }
}

extension RevenueView : UIPickerViewDelegate, UIPickerViewDataSource , UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        categoryTextField.text = names[row]
        picker.isHidden = true;
    }
    
    
}
