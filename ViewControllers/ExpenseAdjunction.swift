//
//  ExpenseAdjunction.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 08.01.2023.
//

import Foundation
import UIKit
import SwiftUI

class ExpenseAdjunction: UIViewController{
    
    /*
     Type: String
     Amount: Int
     Category: Enum
     date: Date
     price: Double
     */

    
    private var expenseField: UIView?
    private var titleField: UITextField?
    private var typePicker: UIHostingController<ExpenseTypePicker>?
    private var priceField: UITextField?
    private var amountField: UITextField?
    private var priceAndAmountStack: UIStackView?
    private var submitField: UIView?
    private var submitLabel: UILabel?
    private var submitExpenseButton: UIButton?
    private var somethingIsMissingAlert: UIAlertController{
        let alert = UIAlertController(title: "Enter all required information.", message: "Something is missing.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        return alert
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Expense"
        
        
        expenseField = UIView()
        expenseField?.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.95, alpha: 1.00)
        expenseField?.layer.cornerRadius = 32
        expenseField?.layer.shadowColor = UIColor.gray.cgColor
        expenseField?.layer.shadowRadius = 10
        expenseField?.layer.shadowOpacity = 1
        expenseField?.layer.shadowOffset = .zero
        
        titleField = UITextField()
        self.titleField!.delegate = self
        titleField?.placeholder = "Title:"
        titleField?.textAlignment = .center
        titleField?.layer.cornerRadius = 16
        titleField?.backgroundColor = .systemBackground
        
        typePicker = UIHostingController(rootView: ExpenseTypePicker())
        addChild(typePicker!)
        typePicker!.view!.backgroundColor = .systemBackground
        typePicker!.view!.layer.cornerRadius = 16
        typePicker!.view!.tintColor = UIColor.black
        
        priceField = UITextField()
        priceField?.keyboardType = .decimalPad
        //priceField?.clearsOnInsertion = true
        //priceField?.textColor = .systemGray
        priceField?.placeholder = "Price:"
        priceField?.textAlignment = .center
        priceField?.backgroundColor = .systemBackground
        priceField?.layer.cornerRadius = 16
        
        amountField = UITextField()
        amountField?.keyboardType = .decimalPad
        amountField?.placeholder = "Quantity:"
        amountField?.textAlignment = .center
        amountField?.backgroundColor = .systemBackground
        amountField?.layer.cornerRadius = 16
        
        priceAndAmountStack = UIStackView()
        priceAndAmountStack?.alignment = .fill
        priceAndAmountStack?.axis = .horizontal
        priceAndAmountStack?.distribution = .fillEqually
        priceAndAmountStack?.spacing = 10
        
        submitField = UIView()
        submitField?.backgroundColor = UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1)
        submitField?.layer.cornerRadius = 16
        submitField?.layer.borderColor = UIColor.gray.cgColor
        submitField?.layer.borderWidth = 0.5
        
        submitLabel = UILabel()
        submitLabel?.text = "Submit"
        submitLabel?.textAlignment = .center
        submitLabel?.textColor = .systemGray
        
        submitExpenseButton = UIButton()
        submitExpenseButton?.addTarget(self, action: #selector(submitButtonActivation), for: .touchUpInside)
        
        
        
        view.addSubview(expenseField!)
        view.addSubview(titleField!)
        view.addSubview(typePicker!.view!)
        view.addSubview(priceAndAmountStack!)
        priceAndAmountStack?.addArrangedSubview(priceField!)
        priceAndAmountStack?.addArrangedSubview(amountField!)
        view.addSubview(submitField!)
        view.addSubview(submitLabel!)
        view.addSubview(submitExpenseButton!)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        expenseField?.translatesAutoresizingMaskIntoConstraints = false
        let expenseFieldXConstraint = expenseField?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let expenseFieldYConstraint = expenseField?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: UIScreen.main.bounds.height * -0.225)
        let expenseFieldWidthConstraint = expenseField?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        let expenseFieldHeightConstraint = expenseField?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        
        view.addConstraints([expenseFieldXConstraint!, expenseFieldYConstraint!, expenseFieldWidthConstraint!, expenseFieldHeightConstraint!])
        
        
        titleField?.translatesAutoresizingMaskIntoConstraints = false
        let titleFieldXConstraint = titleField?.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let titleFieldYConstraint = titleField?.centerYAnchor.constraint(equalTo: expenseField!.centerYAnchor, constant: UIScreen.main.bounds.height * -0.11)
        let titleFieldWidthConstraint = titleField?.widthAnchor.constraint(equalTo: expenseField!.widthAnchor, multiplier: 0.90)
        let titleFieldHeightConstraint = titleField?.heightAnchor.constraint(equalTo: expenseField!.heightAnchor, multiplier: 0.2)
        view.addConstraints([titleFieldXConstraint!, titleFieldYConstraint!, titleFieldWidthConstraint!, titleFieldHeightConstraint!])
        
        typePicker?.view.translatesAutoresizingMaskIntoConstraints = false
        let typePickerXConstraint = typePicker?.view.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let typePickerYConstraint = typePicker?.view.centerYAnchor.constraint(equalTo: titleField!.centerYAnchor, constant: UIScreen.main.bounds.height * 0.07)
        let typePickerWidthConstraint = typePicker?.view.widthAnchor.constraint(equalTo: titleField!.widthAnchor)
        let typePickerHeightConstraint = typePicker?.view.heightAnchor.constraint(equalTo: titleField!.heightAnchor)
        view.addConstraints([typePickerXConstraint!, typePickerYConstraint!, typePickerWidthConstraint!, typePickerHeightConstraint!])
        
        priceAndAmountStack?.translatesAutoresizingMaskIntoConstraints = false
        let fieldXStack = priceAndAmountStack?.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let fieldYStack = priceAndAmountStack?.centerYAnchor.constraint(equalTo: typePicker!.view.centerYAnchor, constant: UIScreen.main.bounds.height * 0.07)
        let fieldHeightStack = priceAndAmountStack?.heightAnchor.constraint(equalTo: titleField!.heightAnchor)
        let fieldWidthStack = priceAndAmountStack?.widthAnchor.constraint(equalTo: titleField!.widthAnchor)
        
        view.addConstraints([fieldXStack!, fieldYStack!, fieldWidthStack!, fieldHeightStack!])
        
        submitField?.translatesAutoresizingMaskIntoConstraints = false
        let submitFieldXConstraint = submitField?.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let submitFieldYConstraint = submitField?.centerYAnchor.constraint(equalTo: priceAndAmountStack!.centerYAnchor, constant: UIScreen.main.bounds.height * 0.075)
        let submitFieldWidthConstraint = submitField?.widthAnchor.constraint(equalTo: titleField!.widthAnchor, multiplier: 0.3)
        let submitFieldHeightConstraint = submitField?.heightAnchor.constraint(equalTo: titleField!.heightAnchor)
        
        view.addConstraints([submitFieldXConstraint!, submitFieldYConstraint!, submitFieldWidthConstraint!, submitFieldHeightConstraint!])
        
        submitLabel?.translatesAutoresizingMaskIntoConstraints = false
        let submitLabelXConstraint = submitLabel?.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let submitLabelYConstraint = submitLabel?.centerYAnchor.constraint(equalTo: submitField!.centerYAnchor)
        let submitLabelWidthConstraint = submitLabel?.widthAnchor.constraint(equalTo: submitField!.widthAnchor)
        let submitLabelHeightConstraint = submitLabel?.heightAnchor.constraint(equalTo: submitField!.heightAnchor)
        
        view.addConstraints([submitLabelXConstraint!, submitLabelYConstraint!, submitLabelWidthConstraint!, submitLabelHeightConstraint!])
        
        submitExpenseButton?.translatesAutoresizingMaskIntoConstraints = false
        let submitButtonXConstraint = submitExpenseButton?.centerXAnchor.constraint(equalTo: expenseField!.centerXAnchor)
        let submitButtonYConstraint = submitExpenseButton?.centerYAnchor.constraint(equalTo: submitField!.centerYAnchor)
        let submitButtonWidthConstraint = submitExpenseButton?.widthAnchor.constraint(equalTo: submitField!.widthAnchor)
        let submitButtonHeightConstraint = submitExpenseButton?.heightAnchor.constraint(equalTo: submitField!.heightAnchor)
        
        view.addConstraints([submitButtonXConstraint!, submitButtonYConstraint!, submitButtonWidthConstraint!, submitButtonHeightConstraint!])
    }
    
    
    @objc func submitButtonActivation(){
        print("Input's submitted")
        if priceField!.text!.isEmpty || titleField!.text!.isEmpty || amountField!.text!.isEmpty{
            
            self.present(somethingIsMissingAlert, animated: true, completion: nil)
        }
    }
    
}


