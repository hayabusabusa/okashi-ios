//
//  MainViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit
import Shared

public final class MainViewController: UIViewController {
    private lazy var tabLayoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionViewLayoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureChildViewControllers()
    }
}

private extension MainViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.addArrangedSubview(tabLayoutView)
        stackView.addArrangedSubview(collectionViewLayoutView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabLayoutView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    func configureChildViewControllers() {
        let collectionViewController = MainCollectionViewController()
        collectionViewController.embed(in: collectionViewLayoutView, viewController: self)
    }
}
