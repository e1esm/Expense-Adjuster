//
//  TabBar.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 06.01.2023.
//

import UIKit

class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            createNavController(for: HomeController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house.circle")!),
            createNavController(for: ExpenseAdjunction(), title: NSLocalizedString("Expense", comment: ""), image: UIImage(systemName: "dollarsign.circle")!),
            createNavController(for: SettingsViewController(), title: NSLocalizedString("Settings", comment: ""), image: UIImage(systemName: "gear.circle")!),
        ]
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController
    {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationItem.title = title
        return navController
    }
}
