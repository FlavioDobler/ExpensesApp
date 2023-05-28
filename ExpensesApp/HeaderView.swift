//
//  HeaderView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 26/05/23.
//

import UIKit

class HeaderView : UIView {
    
    let headerLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Orçamento"
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        return label
    }()
    
    let headerImage : UIImageView = {
        let imview = UIImageView()
        imview.translatesAutoresizingMaskIntoConstraints = false
        imview.image = UIImage(named: "++")
        imview.contentMode = .scaleAspectFit
        return imview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    private func setup(){
        addSubview(headerImage)
        addSubview(headerLabel)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
        
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 12),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            
            headerImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 21),
            headerImage.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor,constant: 189)
        ])
    }
}
