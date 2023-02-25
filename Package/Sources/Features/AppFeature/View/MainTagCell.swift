//
//  MainTagCell.swift
//  
//
//  Created by Shunya Yamada on 2023/02/25.
//

import UIKit

final class MainTagCell: UICollectionViewCell {
    struct Configuration: Hashable {
        let title: String
        let titleLabelColor: UIColor?
        let backgroundColor: UIColor?
    }

    private lazy var labelBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with configuration: Configuration) {
        titleLabel.text = configuration.title
        titleLabel.textColor = configuration.titleLabelColor
        labelBackgroundView.backgroundColor = configuration.backgroundColor
    }
}

private extension MainTagCell {
    func configureSubviews() {
        addSubview(labelBackgroundView)
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            labelBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            labelBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            labelBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
        ])
    }
}
