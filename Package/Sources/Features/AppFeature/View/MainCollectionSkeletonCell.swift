//
//  MainCollectionSkeletonCell.swift
//  
//
//  Created by Shunya Yamada on 2023/02/25.
//

import UIKit

final class MainCollectionSkeletonCell: UICollectionViewCell {
    struct Configuration: Hashable {
        let id: Int
        let backgroundColor: UIColor?
    }

    private lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with configuration: Configuration) {
        view.backgroundColor = configuration.backgroundColor
    }
}

private extension MainCollectionSkeletonCell {
    func configureSubviews() {
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
}
