//
//  BeersRepositoryTests.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import XCTest
@testable import PunkNative

class BeersRepositoryTests: XCTestCase {
    
    var sut: BeersRepository!
    
    override func setUp() {
        super.setUp()
        sut = BeersRepository()
    }
    
    override func tearDown() {
        removeStubs()
        super.tearDown()
    }
    
    // MARK: - Async/await tests
    
    func test_get_beers_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        addSuccessStub()
        
        let beers = try await sut.beers(parameters: [])
        XCTAssertEqual(beers, [testBeer])
    }
    
    func test_get_beers_empty() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        addEmptyStub()

        let beers = try await sut.beers(parameters: [])
        XCTAssertTrue(beers.isEmpty)
    }
    
    func test_get_beers_not_found_error() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }

        addNotFoundErrorStub()
        
        do {
            _ = try await sut.beers(parameters: [])
        } catch {
            XCTAssertEqual(error as? PunkNativeError, .badResponse(error: nil))
        }
    }
}
