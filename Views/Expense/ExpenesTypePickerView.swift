//
//  ExpenesTypePickerView.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 09.01.2023.
//

import Foundation
import SwiftUI

struct ExpenseTypePicker: View{
    
    private var typesOfExpenses: [String]{
        get{
            fillinTypesArray()
        }
    }
    @State private var currentType: String = ExpenseType.housing.rawValue
    @State var pickedExpenseOption: ExpenseType?

    var body: some View{
        Picker("Type", selection: $currentType){
            ForEach(typesOfExpenses, id: \.self){
                Text($0)
            }
        }.onChange(of: currentType){ newType in
            pickedExpenseOption = ExpenseType(rawValue: newType)!
            print(newType)
        }
    }
    
    func fillinTypesArray() -> [String]{
        var typesArray = [String]()
        for type in ExpenseType.allCases{
            typesArray.append(type.rawValue)
        }
        return typesArray
    }
    
}
