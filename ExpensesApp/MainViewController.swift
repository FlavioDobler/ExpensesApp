//
//  ViewController.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 08/05/23.
//

import UIKit

class MainViewController: UIViewController {

    
    let info: InfoView = {
        let view = InfoView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lbuttonView : LeftButtonView = {
        let view = LeftButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let rbuttonView : RightButtonView = {
        let view = RightButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let hview : HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sview : SuggestionView = {
        let view = SuggestionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.cornerRadius = 10
        table.rowHeight = UITableView.automaticDimension
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        return table
    }()
    
    let products = Product.getProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        navCustomization()
        productTableView.delegate = self
        productTableView.dataSource = self
        let leftGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapValueButton) )
        let rightGesureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapExpensesButton))
        lbuttonView.addGestureRecognizer(leftGestureRecognizer)
        rbuttonView.addGestureRecognizer(rightGesureRecognizer)
    }
   
    @objc private func tapExpensesButton() {
        let expenses = ExpensesViewController()
        let navigationController = UINavigationController(rootViewController: expenses)
        present(navigationController, animated: true)

    }
    
    @objc private func tapValueButton() {
        let value = RevenueViewController()
        let navigationController = UINavigationController(rootViewController: value)
        present(navigationController, animated: true)

        
    }
    
    
    func setup() {
        view.addSubview(sview)
        view.addSubview(info)
        view.addSubview(productTableView)
        view.addSubview(lbuttonView)
        view.addSubview(rbuttonView)
        view.addSubview(hview)
        view.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
    }
    
    func navCustomization() {
        navigationItem.title = "Minhas Finanças"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 16)!]
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    
    func layout(){
        NSLayoutConstraint.activate([
            
            info.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 13),
            info.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            info.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            info.heightAnchor.constraint(equalToConstant: 110),
           
            
            lbuttonView.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 12),
            lbuttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            lbuttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -199),
            lbuttonView.heightAnchor.constraint(equalToConstant: 73),
            
            rbuttonView.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 12),
            rbuttonView.leadingAnchor.constraint(equalTo: lbuttonView.trailingAnchor,constant: 8),
            rbuttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            rbuttonView.heightAnchor.constraint(equalToConstant: 73),
        
            productTableView.topAnchor.constraint(equalTo: lbuttonView.bottomAnchor, constant: 12),
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            productTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -242),
            
            sview.topAnchor.constraint(equalTo: productTableView.bottomAnchor, constant: 36),
            sview.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            sview.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            sview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -86)
  
        ])
    }
}

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.product = products[indexPath.row]
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return hview
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }


}
