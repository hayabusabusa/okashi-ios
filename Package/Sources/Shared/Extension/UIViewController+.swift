//
//  UIViewController+.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

public extension UIViewController {
    func embed(in viewController: UIViewController) {
        embed(in: viewController.view, viewController: viewController)
    }

    func embed(in view: UIView, viewController: UIViewController) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.addChild(self)
        view.addSubview(self.view)
        didMove(toParent: viewController)

        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: view.topAnchor),
            self.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
