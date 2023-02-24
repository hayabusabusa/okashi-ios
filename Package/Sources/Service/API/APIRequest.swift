//
//  APIRequest.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public protocol APIRequest {
    associatedtype Response: Decodable

    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var parameters: [String: String] { get }

    func makeURLRequest() throws -> URLRequest
}

public extension APIRequest {
    var baseURL: String {
        "https://sysbird.jp/toriko/api"
    }

    var path: String {
        "/"
    }

    var method: String {
        "GET"
    }

    func makeURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw APIError.invalidURL
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.path = path
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }

        guard let resolvedURL = components?.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: resolvedURL)
        request.httpMethod = method
        return request
    }
}
