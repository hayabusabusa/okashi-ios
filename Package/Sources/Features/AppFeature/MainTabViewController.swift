//
//  MainTabViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

final class MainTabViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
}

// MARK: - Configurations

private extension MainTabViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

private extension MainTabViewController {
    struct Wrapped: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainTabViewController

        func makeUIViewController(context: Context) -> MainTabViewController {
            let vc = MainTabViewController()
            return vc
        }

        func updateUIViewController(_ uiViewController: MainTabViewController, context: Context) {}
    }
}

struct MainTabViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainTabViewController.Wrapped()
            .previewLayout(.fixed(width: 320, height: 80))
    }
}
#endif
