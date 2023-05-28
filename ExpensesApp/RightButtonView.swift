//
//  RightButtonView.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 20/05/23.
//

import UIKit

class RightButtonView: UIView {
 
    lazy var backViewRed : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1)
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var minusImage : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "-")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var rightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Despesa"
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
        addSubview(backViewRed)
        addSubview(minusImage)
        addSubview(rightLabel)
    }
    
    func layout(){
       
        NSLayoutConstraint.activate([
            backViewRed.topAnchor.constraint(equalTo: self.topAnchor),
            backViewRed.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backViewRed.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backViewRed.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            minusImage.topAnchor.constraint(equalTo: backViewRed.topAnchor,constant: 11),
            minusImage.leadingAnchor.constraint(equalTo: backViewRed.leadingAnchor,constant: 80.66),
            minusImage.trailingAnchor.constraint(equalTo: backViewRed.trailingAnchor,constant: -79.87),
            
            rightLabel.topAnchor.constraint(equalTo: minusImage.bottomAnchor,constant: 14.49),
            rightLabel.leadingAnchor.constraint(equalTo: backViewRed.leadingAnchor,constant: 50),
            rightLabel.trailingAnchor.constraint(equalTo: backViewRed.trailingAnchor,constant: -50),
            rightLabel.bottomAnchor.constraint(equalTo: backViewRed.bottomAnchor,constant: -14.26)
        ])
    }
}
