//
//  ProfileBarStack.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 05.01.2023.
//

import Foundation
import UIKit
class ProfileBarStack: UIStackView {
    var currentSalary: UITextView?
    var salaryReminder: UITextView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 1
        distribution = .fillProportionally
        alignment = .center
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    /*
     func setSubviews(){
         currentSalary = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
         salaryReminder = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

         self.addArrangedSubview(currentSalary!)
         self.addArrangedSubview(salaryReminder!)

         currentSalary?.text = "1920"
         salaryReminder?.text = "100"

         setConstraints()

         //currentSalary?.text = String(UserDefaults.standard.integer(forKey: "currentSalary"))
         //salaryReminder?.text = String(UserDefaults.standard.integer(forKey: "currentSalary") - UserDefaults.standard.integer(forKey: "currentExpenses"))

     }

     func setConstraints(){

         currentSalary!.translatesAutoresizingMaskIntoConstraints = false
         let salaryHorizontalConstraint = currentSalary!.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor, constant: -20)
         let salaryVerticalConstraint = currentSalary!.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor, constant: 0)
         let salaryWidthConstraint = currentSalary!.widthAnchor.constraint(equalTo: self.superview!.widthAnchor)
         let salaryHeightConstrain = currentSalary!.heightAnchor.constraint(equalTo: self.superview!.heightAnchor, multiplier: 0.5)
         currentSalary!.addConstraints([salaryHorizontalConstraint, salaryVerticalConstraint, salaryHeightConstrain, salaryWidthConstraint])

         salaryReminder!.translatesAutoresizingMaskIntoConstraints = false
         let reminderHorizontalConstraint = salaryReminder!.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor, constant: 20)
         let reminderVerticalConstraint = salaryReminder!.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor, constant: 0)
         let reminderWidthConstraint = salaryReminder!.widthAnchor.constraint(equalTo: self.superview!.widthAnchor)
         let reminderHeightConstraint = salaryReminder!.heightAnchor.constraint(equalTo: self.superview!.heightAnchor, multiplier: 0.5)
         salaryReminder!.addConstraints([reminderWidthConstraint, reminderHeightConstraint, reminderVerticalConstraint, reminderHorizontalConstraint])

     }
      */
}
