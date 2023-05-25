//
//  ButtonView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 20/05/23.
//

import UIKit

class LeftButtonView: UIView {

    lazy var backViewGreen : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.354, green: 0.679, blue: 0.201, alpha: 1)
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var plusImage : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image =  UIImage(named: "+")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var leftLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Receita"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Roboto-Bold", size: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func setup(){
        addSubview(backViewGreen)
        addSubview(plusImage)
        addSubview(leftLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
        
            backViewGreen.topAnchor.constraint(equalTo: self.topAnchor),
            backViewGreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backViewGreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backViewGreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            plusImage.topAnchor.constraint(equalTo: backViewGreen.topAnchor,constant: 11),
            plusImage.leadingAnchor.constraint(equalTo: backViewGreen.leadingAnchor,constant: 80.66),
            plusImage.trailingAnchor.constraint(equalTo: backViewGreen.trailingAnchor,constant: -79.87),
            
            leftLabel.topAnchor.constraint(equalTo: plusImage.bottomAnchor,constant: 14.49),
            leftLabel.leadingAnchor.constraint(equalTo: backViewGreen.leadingAnchor,constant: 50),
            leftLabel.trailingAnchor.constraint(equalTo: backViewGreen.trailingAnchor,constant: -50),
            leftLabel.bottomAnchor.constraint(equalTo: backViewGreen.bottomAnchor,constant: -14.26)
        
        ])
        
        
        
        
    }
}
