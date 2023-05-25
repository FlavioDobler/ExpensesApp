//
//  SuggestionView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 11/05/23.
//

import Foundation
import UIKit

class SuggestionView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(infoLabel)
        addSubview(tittleLabel)
        addSubview(backgroundSugestionView)
    }
    
    lazy var backgroundSugestionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 0.1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"Roboto-Bold", size: 16)
        label.textAlignment = .center
        label.text = "Crie seu orçamento para facilitar a \n visualização de suas metas"
        label.numberOfLines = 0
        return label
    }()
  
    lazy var tittleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1)
        label.text = "💡 Sugestão"
        return label
    }()
    
    func layout(){
        NSLayoutConstraint.activate([
            
            backgroundSugestionView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundSugestionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundSugestionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundSugestionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            tittleLabel.topAnchor.constraint(equalTo: backgroundSugestionView.topAnchor,constant: 22),
            tittleLabel.leadingAnchor.constraint(equalTo: backgroundSugestionView.leadingAnchor,constant: 138.4),
            tittleLabel.trailingAnchor.constraint(equalTo: backgroundSugestionView.trailingAnchor,constant: 130),
          //  tittleLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor,constant: -4),
                
            infoLabel.topAnchor.constraint(equalTo: backgroundSugestionView.topAnchor, constant: 22),
            infoLabel.leadingAnchor.constraint(equalTo: backgroundSugestionView.leadingAnchor,constant: 12),
            infoLabel.trailingAnchor.constraint(equalTo: backgroundSugestionView.trailingAnchor,constant: -12),
            infoLabel.bottomAnchor.constraint(equalTo: backgroundSugestionView.bottomAnchor,constant: -22)
        ])
    }
    
}
