//
//  SafeDecoding.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public struct SafeDecoding<T>: Decodable where T: Decodable {
    public let value: T?

    public init(value: T? = nil) {
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(T.self)
        } catch {
            self.value = nil
        }
    }
}
