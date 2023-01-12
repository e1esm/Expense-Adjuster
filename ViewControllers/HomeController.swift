//
//  ViewController.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 05.01.2023.
//

import UIKit

class HomeController: UIViewController {
    private var basicProfileField: UIView?
    private var optimizerField: UIView?
    private var currentSalary: UILabel?
    private var salaryReminder: UILabel?
    private var moneyStack: UIStackView?
    private var chartModalActivator: UIButton?
    private var optimizerButton: UIButton?
    private var optimizationText: UILabel?
    private var expensePlaceHolder: UIView?
    private var expenseTableView: UIView?

    private var titleOfScreen: UILabel {
        let homeTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        homeTitle.textAlignment = .left
        homeTitle.text = "Home"
        homeTitle.textAlignment = .left
        homeTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        
        return homeTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // 1-addSubview
    // 2-set constraints
    // UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1)
    
    func setUpNavigationController(){
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        title = "Home"

    }

    func setUpViews() {
        setUpNavigationController()

        basicProfileField = UIView()
        basicProfileField?.backgroundColor = UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1)
        basicProfileField?.layer.cornerRadius = 32
        basicProfileField?.layer.shadowColor = UIColor.gray.cgColor
        basicProfileField?.layer.shadowOpacity = 1
        basicProfileField?.layer.shadowOffset = .zero
        basicProfileField?.layer.shadowRadius = 10

        currentSalary = UILabel()
        currentSalary?.text = "11000$"
        currentSalary?.font = UIFont.boldSystemFont(ofSize: 32)

        salaryReminder = UILabel()
        salaryReminder?.text = "1200$"

        moneyStack = UIStackView()
        moneyStack?.axis = .vertical
        moneyStack?.alignment = .center
        moneyStack?.spacing = 1

        chartModalActivator = UIButton()
        chartModalActivator?.titleLabel?.text = ""
        chartModalActivator?.addTarget(self, action: #selector(chartButtonPressed), for: .touchUpInside)

        optimizerField = UIView()
        optimizerField?.backgroundColor = UIColor(red: 0.71, green: 0.95, blue: 0.77, alpha: 1)
        optimizerField?.layer.cornerRadius = 16
        optimizerField?.layer.borderWidth = 1.5
        optimizerField?.layer.borderColor = UIColor.systemGray.cgColor

        optimizerButton = UIButton()
        optimizerButton?.addTarget(self, action: #selector(optimizationButtonPressed), for: .touchUpInside)

        optimizationText = UILabel()
        optimizationText?.text = "Optimize"
        optimizationText?.textColor = .systemGray
        optimizationText?.textAlignment = .center

        let expenseController = ExpenseTableController()
        addChild(expenseController)
        expenseTableView = expenseController.view
        expenseTableView?.backgroundColor = UIColor.systemGray
        
        expensePlaceHolder = UIView()
        expensePlaceHolder?.layer.cornerRadius = 16
       
        expensePlaceHolder?.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.95, alpha: 1.00)
        expensePlaceHolder?.layer.cornerRadius = 32
        expensePlaceHolder?.layer.shadowColor = UIColor.gray.cgColor
        expensePlaceHolder?.layer.shadowOpacity = 1
        expensePlaceHolder?.layer.shadowOffset = .zero
        expensePlaceHolder?.layer.shadowRadius = 10

        view.addSubview(expensePlaceHolder!)
        view.addSubview(expenseTableView!)
        view.addSubview(optimizerField!)
        view.addSubview(optimizerButton!)
        view.addSubview(optimizationText!)
        view.addSubview(basicProfileField!)
        view.addSubview(moneyStack!)
        view.addSubview(chartModalActivator!)
        moneyStack?.addArrangedSubview(currentSalary!)
        moneyStack?.addArrangedSubview(salaryReminder!)

        setupConstraints()
    }

    func setupConstraints() {
        
        basicProfileField?.translatesAutoresizingMaskIntoConstraints = false
        let fieldXConstraint = basicProfileField?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let fieldYConstraint = basicProfileField?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: UIScreen.main.bounds.height * -0.27) // -0.295
        let fieldWidthConstraint = basicProfileField?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        let fieldHeightConstraint = basicProfileField?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        view.addConstraints([fieldXConstraint!, fieldYConstraint!, fieldWidthConstraint!, fieldHeightConstraint!])

        moneyStack?.translatesAutoresizingMaskIntoConstraints = false
        let stackXConstraint = moneyStack?.centerXAnchor.constraint(equalTo: basicProfileField!.centerXAnchor)
        let stackYConstraint = moneyStack?.centerYAnchor.constraint(equalTo: basicProfileField!.centerYAnchor)
        let stackWidthConstraint = moneyStack?.widthAnchor.constraint(equalTo: basicProfileField!.widthAnchor, multiplier: 1)
        let stackHeightConstraint = moneyStack?.heightAnchor.constraint(equalTo: basicProfileField!.heightAnchor, multiplier: 0.5)
        view.addConstraints([stackXConstraint!, stackYConstraint!, stackWidthConstraint!, stackHeightConstraint!])

        chartModalActivator?.translatesAutoresizingMaskIntoConstraints = false
        let chartButtonXconstraint = chartModalActivator?.centerXAnchor.constraint(equalTo: basicProfileField!.centerXAnchor)
        let chartButtonYconstraint = chartModalActivator?.centerYAnchor.constraint(equalTo: basicProfileField!.centerYAnchor)
        let chartButtonWidthConstraint = chartModalActivator?.widthAnchor.constraint(equalTo: basicProfileField!.widthAnchor, multiplier: 1)
        let chartButtonHeightConstraint = chartModalActivator?.heightAnchor.constraint(equalTo: basicProfileField!.heightAnchor, multiplier: 1)

        view.addConstraints([chartButtonXconstraint!, chartButtonYconstraint!, chartButtonWidthConstraint!, chartButtonHeightConstraint!])

        optimizerField?.translatesAutoresizingMaskIntoConstraints = false
        let optimizerFieldXConstraint = optimizerField?.centerXAnchor.constraint(equalTo: basicProfileField!.centerXAnchor)
        let optimizerFieldYConstraint = optimizerField?.centerYAnchor.constraint(equalTo: basicProfileField!.centerYAnchor, constant: 160)
        let optimizerFieldHeightConstraint = optimizerField?.heightAnchor.constraint(equalTo: basicProfileField!.heightAnchor, multiplier: 0.25)
        let optimizerFieldWidthConstraint = optimizerField?.widthAnchor.constraint(equalTo: basicProfileField!.widthAnchor, multiplier: 0.3)
        view.addConstraints([optimizerFieldXConstraint!, optimizerFieldYConstraint!, optimizerFieldWidthConstraint!, optimizerFieldHeightConstraint!])

        optimizerButton?.translatesAutoresizingMaskIntoConstraints = false
        let optimizerButtonXConstraint = optimizerButton?.centerXAnchor.constraint(equalTo: optimizerField!.centerXAnchor)
        let optimizerButtonYConstraint = optimizerButton?.centerYAnchor.constraint(equalTo: optimizerField!.centerYAnchor)
        let optimizerButtonWidthConstraint = optimizerButton?.widthAnchor.constraint(equalTo: optimizerField!.widthAnchor)
        let optimizerButtonHeightConstraint = optimizerButton?.heightAnchor.constraint(equalTo: optimizerField!.heightAnchor)
        view.addConstraints([optimizerButtonXConstraint!, optimizerButtonYConstraint!, optimizerButtonWidthConstraint!, optimizerButtonHeightConstraint!])

        optimizationText?.translatesAutoresizingMaskIntoConstraints = false
        let optimizationTextXConstraint = optimizationText?.centerXAnchor.constraint(equalTo: optimizerField!.centerXAnchor)
        let optimizationTextYConstraint = optimizationText?.centerYAnchor.constraint(equalTo: optimizerField!.centerYAnchor)
        let optimizationTextWidthConstraint = optimizationText?.widthAnchor.constraint(equalTo: optimizerField!.widthAnchor)
        let optimizationTextHeightConstraint = optimizationText?.heightAnchor.constraint(equalTo: optimizerField!.heightAnchor)
        view.addConstraints([optimizationTextXConstraint!, optimizationTextYConstraint!, optimizationTextWidthConstraint!, optimizationTextHeightConstraint!])

        expenseTableView?.translatesAutoresizingMaskIntoConstraints = false
        let expenseTableXConstraint = expenseTableView?.centerXAnchor.constraint(equalTo: optimizerField!.centerXAnchor)
        let expenseTableYConstraint = expenseTableView?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140)
        let expenseTableWidthConstraint = expenseTableView?.widthAnchor.constraint(equalTo: basicProfileField!.widthAnchor, multiplier: 1)
        let expenseTableHeightConstraint = expenseTableView?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)

        view.addConstraints([expenseTableXConstraint!, expenseTableYConstraint!, expenseTableWidthConstraint!, expenseTableHeightConstraint!])
        
        expensePlaceHolder?.translatesAutoresizingMaskIntoConstraints = false
        let expensePlaceHolderXConstraint = expensePlaceHolder?.centerXAnchor.constraint(equalTo: expenseTableView!.centerXAnchor)
        let expensePlaceHolderYConstraint = expensePlaceHolder?.centerYAnchor.constraint(equalTo: expenseTableView!.centerYAnchor)
        let expensePlaceHolderWidthConstraint = expensePlaceHolder?.widthAnchor.constraint(equalTo: expenseTableView!.widthAnchor, multiplier: 1.15)
        let expensePlaceHolderHeightConstraint = expensePlaceHolder?.heightAnchor.constraint(equalTo: expenseTableView!.heightAnchor, multiplier: 1.15)
        
        view.addConstraints([expensePlaceHolderXConstraint!, expensePlaceHolderYConstraint!, expensePlaceHolderWidthConstraint!, expensePlaceHolderHeightConstraint!])
    }

    @objc func chartButtonPressed() {
        let modalViewController = ModalViewController()
        // modalViewController.modalPresentationStyle = .overCurrentContext
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(modalViewController, animated: true, completion: nil)
        print("Button is pressed")
    }

    @objc func optimizationButtonPressed() {
        print("Optimization Button's pressed")
    }
}
