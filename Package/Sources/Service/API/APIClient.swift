//
//  APIClient.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Foundation

public protocol APIClientProtocol {
    func call<T: APIRequest>(with request: T) async throws -> T.Response
}

public final class APIClient: APIClientProtocol {
    public static let shared = APIClient()

    private init() {}

    public func call<T: APIRequest>(with request: T) async throws -> T.Response {
        let urlRequest = try request.makeURLRequest()
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpURLResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        switch httpURLResponse.statusCode {
        case 200..<300:
            let decoded = try JSONDecoder().decode(T.Response.self, from: data)
            return decoded
        case 400..<500:
            throw APIError.badRequest(httpURLResponse.statusCode)
        default:
            throw APIError.internalServerError(httpURLResponse.statusCode)
        }
    }
}
