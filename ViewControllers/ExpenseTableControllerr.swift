//
//  ExpenseController.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 07.01.2023.
//

import Foundation
import UIKit

class ExpenseTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var typesOfExpenses = [String]()
    
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        typesOfExpenses.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let historyViewController = HistoryViewController()
        historyViewController.titleOfTheView = cell!.textLabel!.text!
        navigationController?.pushViewController(historyViewController, animated: false)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = typesOfExpenses[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.95, alpha: 1.00)
        cell.imageView?.image = UIImage(systemName: "arrow.forward")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        return cell
    }
    
    var expenseTable: UITableView?
    
    override func viewDidLoad() {
        expenseTable = UITableView()
        
        expenseTable?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        expenseTable?.dataSource = self
        expenseTable?.delegate = self
        expenseTable?.isScrollEnabled = true
        expenseTable?.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.95, alpha: 1.00)
        view.addSubview(expenseTable!)
        setUpArray()
        setupConstraints()
    }
    
    func setupConstraints() {
        expenseTable?.translatesAutoresizingMaskIntoConstraints = false
        let expenseTableXConstraint = expenseTable!.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let expenseTableYConstraint = expenseTable!.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let expenseTableHeightConstraint = expenseTable!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        let expenseTableWidthConstraint = expenseTable!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        view.addConstraints([expenseTableXConstraint, expenseTableYConstraint, expenseTableWidthConstraint, expenseTableHeightConstraint])
    }
    
    func setUpArray(){
        for type in ExpenseType.allCases{
            typesOfExpenses.append(type.rawValue)
        }
    }
}
