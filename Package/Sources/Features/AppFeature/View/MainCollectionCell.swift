//
//  MainCollectionCell.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Nuke
import UIKit

final class MainCollectionCell: UICollectionViewCell {
    struct Configuration: Hashable {
        let title: String
        let imageURL: String?
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray6.cgColor
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with configuration: Configuration) {
        loadImage(for: configuration.imageURL)
    }
}

private extension MainCollectionCell {
    func configureSubviews() {
        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }

    func loadImage(for imageURL: String?) {
        guard let imageURL,
              let url = URL(string: imageURL) else { return }
        Task {
            do {
                let response = try await ImagePipeline.shared.image(for: url)
                imageView.image = response.image
            } catch {
                print(error)
            }
        }
    }
}
