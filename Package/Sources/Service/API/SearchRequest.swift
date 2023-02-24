//
//  SearchRequest.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation
import Shared

public struct SearchRequest: APIRequest {
    public typealias Response = Okashi

    public let keyword: String
    public let max: Int?
    public let offSet: Int?
    public let sort: SortType?
    public let order: OrderType?

    public var parameters: [String : String] {
        var params = [
            "apikey": "guest",
            "keyword": keyword
        ]

        if let max {
            params["max"] = String(max)
        }
        if let offSet {
            params["offset"] = String(offSet)
        }
        if let sort {
            params["sort"] = sort.rawValue
        }
        if let order {
            params["order"] = order.rawValue
        }

        return params
    }

    public init(keyword: String,
                max: Int? = nil,
                offSet: Int? = nil,
                sort: SearchRequest.SortType? = nil,
                order: SearchRequest.OrderType? = nil) {
        self.keyword = keyword
        self.max = max
        self.offSet = offSet
        self.sort = sort
        self.order = order
    }
}

public extension SearchRequest {
    enum SortType: String {
        case kana
        case area
        case regist
        case maker
    }

    enum OrderType: String {
        case ascending = "a"
        case descending = "d"
        case random = "r"
    }
}
