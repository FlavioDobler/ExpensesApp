//
//  ExpensesViewController.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 16/05/23.
//

import UIKit

class ExpensesViewController: UIViewController {
    
    let expView : ExpensesView = {
        let view = ExpensesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
        setup()
        navCustomization()
        configureNavItems()
        layout()
        
    }
    
    func setup(){
        view.addSubview(expView)
        view.addSubview(backButton)
    }
    
    @objc private func tapSaveButton(){
        if expView.valueTextField.text == "" || expView.nameTextField.text == "" {
            let alert = UIAlertController(title: "Campos Inválidos", message: "Preencher os campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert,animated: true, completion: nil)
        } else {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc private func tapBackButton(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            expView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
            expView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            expView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
            
            
        ])
    }
    
    func navCustomization() {
        navigationItem.title = "Nova Despesa"
        navigationController?.navigationBar.prefersLargeTitles = true

        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 28)!]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            let alert = UIAlertController(title: "Deseja Sair?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert,animated: true,completion: nil)
            }
        }
    
    
    private func configureNavItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(tapSaveButton))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        if let font = UIFont(name: "Roboto-Regular", size: 16) {
            UIBarButtonItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font: font
                ],
                for: UIControl.State.normal)
            
            
            
        }
        
    }
}

extension ExpensesViewController : UINavigationControllerDelegate {
   
}
