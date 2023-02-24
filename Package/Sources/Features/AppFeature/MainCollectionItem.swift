//
//  MainCollectionItem.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit
import Shared

extension MainCollectionViewController {
    enum Item: DiffableItem {
        case item

        func cell(for collectionView: UICollectionView, at indexPath: IndexPath, with viewController: UIViewController) -> UICollectionViewCell {
            switch self {
            case .item:
                let cell = collectionView.dequeueReusableCell(MainCollectionCell.self, for: indexPath)
                return cell
            }
        }
    }
}
