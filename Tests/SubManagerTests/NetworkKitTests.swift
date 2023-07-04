//
//  NetworkKitTests.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import XCTest
@testable import SubManager

// swiftlint:disable force_unwrapping
class HTTPSessionTests: XCTestCase {
    var session: HTTPSession!

    override func setUp() {
        super.setUp()
        session = HTTPSession()
    }

    override func tearDown() {
        session = nil
        super.tearDown()
    }

    func testSendRequest_ValidRequest() async throws {
        // Create a mock HTTPRequest with valid data
        let request = HTTPRequest(url: URL(string: "https://example.com")!,
                                  method: .get,
                                  headers: ["Content-Type": "application/json"],
                                  body: nil)

        do {
            let data = try await session.sendRequest(request)
            XCTAssertNotNil(data)
            // Additional assertions on the received data if needed
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
// swiftlint:enable force_unwrapping
