//
//  Expense.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 05.01.2023.
//

import Foundation


class Expense: Codable{
    var type: String
    var amount: Int
    var date: Date
    var price: Double
    
    init(type: String, amount: Int, date: Date, price: Double) {
        self.type = type
        self.amount = amount
        self.date = date
        self.price = price
    }
    
}
