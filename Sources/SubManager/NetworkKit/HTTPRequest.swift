//
//  HTTPRequest.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import Foundation

struct HTTPRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?

    init(url: URL, method: HTTPMethod, headers: [String: String]? = nil, body: Data? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}
