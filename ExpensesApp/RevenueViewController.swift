//
//  RevenueViewController.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 18/05/23.
//

import UIKit

class RevenueViewController: UIViewController {

    lazy var saveLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Salvar"
        label.textColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: 16)
        return label
    }()
    
    let revView : RevenueView = {
        let view = RevenueView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
        navCustomization()
        configureNavItems()
        setup()
        layout()
    }
    
    func setup(){
        view.addSubview(revView)
    }

    func layout(){
        
        NSLayoutConstraint.activate([
            revView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
            revView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            revView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
            
        
        ])
    }
    
    @objc private func tapSaveButton(){
        if revView.valueTextField.text == "" || revView.nameTextField.text == "" || revView.categoryTextField.text == "" {
            let alert = UIAlertController(title: "Campos Inválidos", message: "Preencher os campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert,animated: true, completion: nil)
        } else {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func navCustomization() {
        navigationItem.title = "Nova Receita"
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 28)!]
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
  
    private func configureNavItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(tapSaveButton))
        
        if let font = UIFont(name: "Roboto-Regular", size: 16) {
            UIBarButtonItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font: font
                ],
                for: UIControl.State.normal)
        }
       
    }
    
}
