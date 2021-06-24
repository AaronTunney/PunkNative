//
//  PunkNativeTests.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import Combine
import XCTest
@testable import PunkNative

class PunkNativeTests: XCTestCase {
    
    var sut: PunkNative!
    var mockRepository: MockBeerRepository!
    var disposables = Set<AnyCancellable>()
    let defaultTimeout: TimeInterval = 5
    
    override func setUp() {
        super.setUp()
        
        mockRepository = MockBeerRepository()
        sut = PunkNative(service: mockRepository)
    }
    
    // MARK: - Async/await tests
    
    func test_get_beers_async_await_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        let beers = try await sut.beers(parameters: [])
        XCTAssertEqual(beers, [testBeer])
    }
    
    func test_get_beers_async_await_empty() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        mockRepository.state = .empty

        let beers = try await sut.beers(parameters: [])
        XCTAssertTrue(beers.isEmpty)
    }
    
    func test_get_beers_async_await_error() async throws {
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
    
    func test_random_beer_async_await_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        let beer = try await sut.randomBeer()
        XCTAssertEqual(beer, testBeer)
    }
    
    func test_random_beer_async_await_error() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        mockRepository.state = .error(error: MockError.genericError)
        
        do {
            _ = try await sut.randomBeer()
        } catch {
            XCTAssertEqual(error as? MockError, .genericError)
        }
    }
    
    // MARK: - Combine tests

    func test_get_beers_combine_success() {
        let successExpectation = expectation(description: #function)
        
        sut.beers(parameters: [])
            .sink { complete in
                switch complete {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                successExpectation.fulfill()
            } receiveValue: { response in
                XCTAssertEqual(response, [testBeer])
            }
            .store(in: &disposables)
            
        wait(for: [successExpectation], timeout: defaultTimeout)
    }
    
    func test_get_beers_combine_empty() {
        mockRepository.state = .empty

        let emptyExpectation = expectation(description: #function)
        
        sut.beers(parameters: [])
            .sink { complete in
                switch complete {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                emptyExpectation.fulfill()
            } receiveValue: { response in
                XCTAssertTrue(response.isEmpty)
            }
            .store(in: &disposables)
            
        wait(for: [emptyExpectation], timeout: defaultTimeout)
    }

    func test_get_beers_combine_error() {
        mockRepository.state = .error(error: MockError.genericError)

        let errorExpectation = expectation(description: #function)
        
        sut.beers(parameters: [])
            .sink { complete in
                switch complete {
                case .finished:
                    XCTFail("Call succeded, expected error")
                case .failure(let error):
                    XCTAssertEqual(error as? MockError, .genericError)
                }
                errorExpectation.fulfill()
            } receiveValue: { _ in }
            .store(in: &disposables)
            
        wait(for: [errorExpectation], timeout: defaultTimeout)
    }
    
    func test_random_beer_combine_success() {
        let successExpectation = expectation(description: #function)
        
        sut.randomBeer()
            .sink { complete in
                switch complete {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                successExpectation.fulfill()
            } receiveValue: { response in
                XCTAssertEqual(response, testBeer)
            }
            .store(in: &disposables)
            
        wait(for: [successExpectation], timeout: defaultTimeout)
    }

    func test_random_beer_combine_error() {
        mockRepository.state = .error(error: MockError.genericError)

        let errorExpectation = expectation(description: #function)
        
        sut.randomBeer()
            .sink { complete in
                switch complete {
                case .finished:
                    XCTFail("Call succeded, expected error")
                case .failure(let error):
                    XCTAssertEqual(error as? MockError, .genericError)
                }
                errorExpectation.fulfill()
            } receiveValue: { _ in }
            .store(in: &disposables)
            
        wait(for: [errorExpectation], timeout: defaultTimeout)
    }
}
