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
        case item(MainCollectionCell.Configuration)

        func cell(for collectionView: UICollectionView, at indexPath: IndexPath, with viewController: UIViewController) -> UICollectionViewCell {
            switch self {
            case .item(let configuration):
                let cell = collectionView.dequeueReusableCell(MainCollectionCell.self, for: indexPath)
                cell.configure(with: configuration)
                return cell
            }
        }
    }
}
