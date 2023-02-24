//
//  MainCollectionSection.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit
import Shared

extension MainCollectionViewController {
    enum Section: DiffableSection {
        case item

        var layout: NSCollectionLayoutSection {
            switch self {
            case .item:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
    }
}
