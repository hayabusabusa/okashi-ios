//
//  Okashi.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public struct Okashi: Decodable {
    public let item: [Item]
    public let status, count: String

    public init(item: [Item],
                status: String,
                count: String) {
        self.item = item
        self.status = status
        self.count = count
    }
}

public extension Okashi {
    struct Item: Decodable {
        public let id, name, kana, maker: String
        public let price: String
        public let type: String
        public let url: String
        public let tags: Tags?
        public let image: String
        public let comment: String
        public let area: String?

        public init(id: String,
                    name: String,
                    kana: String,
                    maker: String,
                    price: String,
                    type: String,
                    url: String,
                    tags: Tags,
                    image: String,
                    comment: String,
                    area: String?) {
            self.id = id
            self.name = name
            self.kana = kana
            self.maker = maker
            self.price = price
            self.type = type
            self.url = url
            self.tags = tags
            self.image = image
            self.comment = comment
            self.area = area
        }
    }
}

public extension Okashi.Item {
    struct Tags: Decodable {
        public let tag: [String]

        public init(tag: [String]) {
            self.tag = tag
        }
    }
}
