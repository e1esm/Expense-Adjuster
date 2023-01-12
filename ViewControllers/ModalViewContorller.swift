//
//  ModalViewContorller.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 06.01.2023.
//

import Foundation
import SwiftUI
import UIKit
class ModalViewController: UIViewController {
    var chartView: UIHostingController<ChartView>?

    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        view.isOpaque = false

        chartView = UIHostingController(rootView: ChartView())
        addChild(chartView!)
        view.addSubview(chartView!.view)
        setupConstraints()
        chartView!.didMove(toParent: self)
    }

    func setupConstraints() {
        chartView!.view.translatesAutoresizingMaskIntoConstraints = false
        let chartXConstraint = chartView?.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let chartYConstraint = chartView?.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let chartWidthConstraint = chartView?.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        let chartHeightConstraint = chartView?.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)

        view.addConstraints([chartYConstraint!, chartXConstraint!, chartWidthConstraint!, chartHeightConstraint!])
    }
}
