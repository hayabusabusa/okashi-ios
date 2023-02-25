//
//  MainTagViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Combine
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

    private let viewModel: MainTagViewModelable = MainTagViewModel()
    private var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureSubscriptions()

        Task {
            await viewModel.input.viewDidLoad()
        }
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

private extension MainTagViewController {
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
