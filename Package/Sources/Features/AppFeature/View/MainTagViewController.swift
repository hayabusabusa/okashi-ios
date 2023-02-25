//
//  MainTagViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

final class MainTagViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
}

// MARK: - Configurations

private extension MainTagViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(dividerView)

        NSLayoutConstraint.activate([
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

private extension MainTagViewController {
    struct Wrapped: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainTagViewController

        func makeUIViewController(context: Context) -> MainTagViewController {
            let vc = MainTagViewController()
            return vc
        }

        func updateUIViewController(_ uiViewController: MainTagViewController, context: Context) {}
    }
}

struct MainTabViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainTagViewController.Wrapped()
            .previewLayout(.fixed(width: 320, height: 80))
    }
}
#endif
