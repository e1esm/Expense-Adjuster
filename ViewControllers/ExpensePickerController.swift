//
//  ExpensePickerController.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 08.01.2023.
//

import Foundation
import UIKit


class ExpensePickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        expenseTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    
    var expenseTypes = [ExpenseType]()
    var pickerButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInTypes()
    }
    
    func fillInTypes(){
        for type in ExpenseType.allCases{
            expenseTypes.append(type)
        }
    }
    
    
}
