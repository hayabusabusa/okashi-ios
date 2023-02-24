//
//  MainCollectionViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Combine
import UIKit
import Shared

final class MainCollectionViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = makeCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionCell.self)
        return collectionView
    }()

    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else { return nil }
            return itemIdentifier.cell(for: collectionView, at: indexPath, with: self)
        }
    }()

    private let viewModel: MainCollectionViewModelable = MainCollectionViewModel()
    private var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureSubscriptions()

        viewModel.input.viewDidLoad()
    }
}

// MARK: - Configurations

private extension MainCollectionViewController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    func configureSubscriptions() {
        viewModel.output.sections
            .receive(on: DispatchQueue.main)
            .sink { [weak self] sections in
                self?.applySnapshot(with: sections)
            }
            .store(in: &subscriptions)
    }

    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            self?.dataSource.snapshot().sectionIdentifiers[section].layout
        }
    }
}

// MARK: - Private

private extension MainCollectionViewController {
    func applySnapshot(with sections: [(Section, [Item])]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        sections.forEach { (section, items) in
            snapshot.appendSections([section])
            snapshot.appendItems(items, toSection: section)
        }
        dataSource.apply(snapshot)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

private extension MainCollectionViewController {
    struct Wrapped: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainCollectionViewController

        func makeUIViewController(context: Context) -> MainCollectionViewController {
            let vc = MainCollectionViewController()
            return vc
        }

        func updateUIViewController(_ uiViewController: MainCollectionViewController, context: Context) {}
    }
}

struct MainCollectionViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainCollectionViewController.Wrapped()
    }
}
#endif
