//
//  UICollectionView+.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: String(describing: type(of: cellType)))
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: String(describing: type(of: cellType)), for: indexPath) as! T
    }
}
