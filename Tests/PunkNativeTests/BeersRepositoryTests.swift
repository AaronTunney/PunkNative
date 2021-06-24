//
//  BeersRepositoryTests.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import Combine
import XCTest
@testable import PunkNative

class BeersRepositoryTests: XCTestCase {
    
    var sut: BeersRepository!
    var disposables = Set<AnyCancellable>()
    let defaultTimeout: TimeInterval = 5
    
    override func setUp() {
        super.setUp()
        sut = BeersRepository()
    }
    
    override func tearDown() {
        removeStubs()
        super.tearDown()
    }
    
    // MARK: - Async/await tests
    
    func test_get_beers_async_await_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        addSuccessStub()
        
        let beers = try await sut.beers(parameters: [])
        XCTAssertEqual(beers, [testBeer])
    }
    
    func test_get_beers_async_await_empty() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        addEmptyStub()

        let beers = try await sut.beers(parameters: [])
        XCTAssertTrue(beers.isEmpty)
    }
    
    func test_get_beers_async_await_not_found_error() async throws {
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
    
    func test_random_beer_async_await_success() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        addRandomBeerStub()
        
        let beer = try await sut.randomBeer()
        XCTAssertEqual(beer, testBeer)
    }

    func test_random_beer_async_await_not_found_error() async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }

        addNotFoundErrorStub()
        
        do {
            _ = try await sut.randomBeer()
        } catch {
            XCTAssertEqual(error as? PunkNativeError, .badResponse(error: nil))
        }
    }
    
    // MARK: - Combine tests
    
    func test_get_beers_combine_success() {
        addSuccessStub()
        
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
        addEmptyStub()
        
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
    
    func test_get_beers_combine_not_found_error() {
        addNotFoundErrorStub()
        
        let errorExpectation = expectation(description: #function)
        
        sut.beers(parameters: [])
            .sink { complete in
                switch complete {
                case .finished:
                    XCTFail("Call succeded, expected error")
                case .failure(let error):
                    XCTAssertEqual(error as? PunkNativeError, .badResponse(error: nil))
                }
                errorExpectation.fulfill()
            } receiveValue: { _ in }
            .store(in: &disposables)
        
        wait(for: [errorExpectation], timeout: defaultTimeout)
    }
    
    func test_random_beer_combine_success() {
        addRandomBeerStub()
        
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
    
    func test_random_beer_combine_not_found_error() {
        addNotFoundErrorStub()
        
        let errorExpectation = expectation(description: #function)
        
        sut.randomBeer()
            .sink { complete in
                switch complete {
                case .finished:
                    XCTFail("Call succeded, expected error")
                case .failure(let error):
                    XCTAssertEqual(error as? PunkNativeError, .badResponse(error: nil))
                }
                errorExpectation.fulfill()
            } receiveValue: { _ in }
            .store(in: &disposables)
        
        wait(for: [errorExpectation], timeout: defaultTimeout)
    }
}
