//
//  SnackOverFlowTests.swift
//  SnackOverFlowTests
//
//  Created by Oğuz on 6.09.2023.
//

import XCTest
    @testable import SnackOverFlow

final class SnackOverFlowTests: XCTestCase {

    func testFetchUserAndCheck() async throws {
        let manager = NetworkManager.networkManager
        
        do {
            let userResponse = try await manager.fetch(path: .users, method: .get, type: UsersResponse.self)
            XCTAssertEqual(userResponse?.data?.isEmpty, false)
        } catch {
            XCTFail("Hata: \(error)")
        }
    }
}
