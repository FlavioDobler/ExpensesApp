//
//  NavBar.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 23/05/23.
//

import UIKit

extension UINavigationBar {
    
    func setupNavigationAppearence(
        backgroudColor : UIColor,
        textColor: UIColor
    
    
    ){
        var appearence = UINavigationBar.appearance()
        
        let customAppearence = UINavigationBarAppearance()
        customAppearence.backgroundColor = backgroudColor
        customAppearence.configureWithOpaqueBackground()
        customAppearence.shadowColor = .clear
        customAppearence.shadowImage = .init()
       
        let buttonAppearence = customAppearence.buttonAppearance.normal
        buttonAppearence.titleTextAttributes = [
            .foregroundColor: textColor,
            .font : UIFont(name: "Roboto-Bold", size: 16)!
        
        ]
        
        let highlightButtonAppearence = customAppearence.buttonAppearance.highlighted
        highlightButtonAppearence.titleTextAttributes = [
            .foregroundColor: textColor.withAlphaComponent(0.8),
            .font : UIFont(name: "Roboto-Bold", size: 16)!
        ]
        
        customAppearence.largeTitleTextAttributes = [
            .foregroundColor : textColor,
            .font : UIFont(name: "Roboto-Bold", size: 16)!
        
        ]
        
        //Vertical
        appearence.standardAppearance = customAppearence
        
        //Vertical + Scroll
        appearence.scrollEdgeAppearance = customAppearence
        
        
    }
    
}
