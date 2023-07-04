//
//  HTTPSession.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import Foundation

struct HTTPSession {
    private let session: URLSession

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        session = URLSession(configuration: configuration)
    }

    func sendRequest(_ request: HTTPRequest) async throws -> Data {
        guard let urlRequest = createURLRequest(from: request) else {
            throw HTTPRequestError.invalidURL
        }

        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              200 ..< 300 ~= httpResponse.statusCode else {
            throw HTTPRequestError.invalidResponse
        }

        return data
    }

    private func createURLRequest(from request: HTTPRequest) -> URLRequest? {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        return urlRequest
    }
}
