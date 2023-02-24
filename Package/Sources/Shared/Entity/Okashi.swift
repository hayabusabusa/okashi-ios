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
        public let id, name: String
        public let kana: SafeDecoding<String>
        public let maker: SafeDecoding<String>
        public let price: SafeDecoding<String>
        public let type: String
        public let url: String
        public let tags: Tags?
        public let image: String
        public let comment: String
        public let area: String?

        public init(id: String,
                    name: String,
                    kana: SafeDecoding<String>,
                    maker: SafeDecoding<String>,
                    price: SafeDecoding<String>,
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

        private enum CodingKeys: CodingKey {
            case tag
        }

        public init(tag: [String]) {
            self.tag = tag
        }

        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)

            // String で返ってくることもあるので、String も許容する
            if let string = try? container.decode(String.self, forKey: .tag) {
                self.tag = [string]
            } else {
                self.tag = try container.decode([String].self, forKey: .tag)
            }
        }
    }
}
