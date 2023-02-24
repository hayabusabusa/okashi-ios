//
//  OkashiTypesRequest.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation
import Shared

public struct OkashiTypesRequest: APIRequest {
    public typealias Response = OkashiTypes

    public var parameters: [String : String] {
        [
            "apikey": "guest",
            "format": "json",
            "list": "type"
        ]
    }

    public init() {}
}
