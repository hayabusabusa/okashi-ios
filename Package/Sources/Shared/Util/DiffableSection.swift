//
//  DiffableSection.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

public protocol DiffableSection: Hashable {
    var layout: NSCollectionLayoutSection { get }
}

public protocol DiffableItem: Hashable {
    func cell(for collectionView: UICollectionView, at indexPath: IndexPath, with viewController: UIViewController) -> UICollectionViewCell
}
