//
//  Products.swift
//  ExpensesApp
//
//  Created by Flavio Dobler on 10/05/23.
//

import Foundation


class Product {
    
    static func getProducts () -> [ProductModel]{
        let products = [
            ProductModel(name: "Novo Carro", cashSymbol: "R$", paidPrice: "2.000,00", totalValueCashSymbol: "R$" ,totalValue: "80.000,00"),
            ProductModel(name: "TV", cashSymbol: "R$", paidPrice: "3.000,00", totalValueCashSymbol: "R$" ,totalValue: "3.500,00"),
            ProductModel(name: "Férias nas Maldivas", cashSymbol: "R$", paidPrice: "1,50", totalValueCashSymbol: "R$" ,totalValue: "200.000,00"),
        
        
        ]
        return products
    }
}
