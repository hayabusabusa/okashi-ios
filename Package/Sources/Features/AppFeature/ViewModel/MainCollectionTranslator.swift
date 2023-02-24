//
//  MainCollectionTranslator.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation
import Shared

struct MainCollectionTranslator: Translatable {
    typealias Input = Okashi
    typealias Output = [(MainCollectionViewController.Section, [MainCollectionViewController.Item])]

    func translate(_ input: Okashi) -> [(MainCollectionViewController.Section, [MainCollectionViewController.Item])] {
        let items = input.item.map {
            MainCollectionViewController.Item.item(MainCollectionCell.Configuration(title: $0.name,
                                                                                    imageURL: $0.image))

        }
        return [(.item, items)]
    }
}
