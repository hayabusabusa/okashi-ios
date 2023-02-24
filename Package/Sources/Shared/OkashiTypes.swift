//
//  OkashiTypes.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public struct OkashiTypes: Decodable {
    public let type: [OkashiType]
}

public extension OkashiTypes {
    struct OkashiType: Decodable {
        public let id: String
        public let slug: String
        public let name: String
    }
}
