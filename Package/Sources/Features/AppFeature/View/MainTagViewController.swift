//
//  MainTagViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

final class MainTagViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = makeCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainTagCell.self)
        return collectionView
    }()

    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else { return nil }
            return itemIdentifier.cell(for: collectionView, at: indexPath, with: self)
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        applyStubSnapshot()
    }
}

// MARK: - Configurations

private extension MainTagViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(dividerView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            self?.dataSource.snapshot().sectionIdentifiers[section].layout
        }
    }

    func applyStubSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.grid])
        snapshot.appendItems([
            .tag(MainTagCell.Configuration(title: "クッキー", titleLabelColor: .white, backgroundColor: .systemBlue)),
            .tag(MainTagCell.Configuration(title: "おせんべい", titleLabelColor: .white, backgroundColor: .systemBlue))
        ])
        dataSource.apply(snapshot)
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
