//
//  APIError.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case invalidResponse
    case badRequest(Int)
    case internalServerError(Int)
}
