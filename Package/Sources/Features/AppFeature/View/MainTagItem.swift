//
//  MainTagItem.swift
//  
//
//  Created by Shunya Yamada on 2023/02/25.
//

import UIKit
import Shared

extension MainTagViewController {
    enum Item: DiffableItem {
        case tag(MainTagCell.Configuration)

        func cell(for collectionView: UICollectionView, at indexPath: IndexPath, with viewController: UIViewController) -> UICollectionViewCell {
            switch self {
            case .tag(let configuration):
                let cell = collectionView.dequeueReusableCell(MainTagCell.self, for: indexPath)
                cell.configure(with: configuration)
                return cell
            }
        }
    }
}
