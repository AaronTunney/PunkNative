//
//  PunkNativeTests.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import XCTest
@testable import PunkNative

class PunkNativeTests: XCTestCase {
    
    var sut: PunkNative!
    var mockRepository: MockBeerRepository!
    
    override func setUp() {
        super.setUp()
        
        mockRepository = MockBeerRepository()
        sut = PunkNative(service: mockRepository)
    }
    
    // MARK: - Async/await tests
    
    func test_get_beers_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        let beers = try await sut.beers(parameters: [])
        XCTAssertEqual(beers, [testBeer])
    }
    
    func test_get_beers_empty() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        mockRepository.state = .empty

        let beers = try await sut.beers(parameters: [])
        XCTAssertTrue(beers.isEmpty)
    }
    
    func test_get_beers_error() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        mockRepository.state = .error(error: MockError.genericError)
        
        do {
            _ = try await sut.beers(parameters: [])
        } catch {
            XCTAssertEqual(error as? MockError, .genericError)
        }
    }
}
