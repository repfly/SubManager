//
//  HTTPRequestError.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

enum HTTPRequestError: Error, Equatable {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData

    static func == (lhs: HTTPRequestError, rhs: HTTPRequestError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
}
