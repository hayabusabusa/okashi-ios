//
//  MainTagSection.swift
//  
//
//  Created by Shunya Yamada on 2023/02/25.
//

import UIKit
import Shared

extension MainTagViewController {
    enum Section: DiffableSection {
        case grid

        var layout: NSCollectionLayoutSection {
            switch self {
            case .grid:
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(40), heightDimension: .absolute(40))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(40), heightDimension: .absolute(40))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
                return section
            }
        }
    }
}
