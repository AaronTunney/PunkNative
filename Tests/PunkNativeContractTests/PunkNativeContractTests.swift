//
//  PunkNativeContractTests.swift
//  PunkNativeContractTests
//
//  Created by Aaron Tunney on 16/06/2021.
//

import Foundation
import XCTest
@testable import PunkNative

/// Contract tests for `PunkNative`.
/// Note: Run these tests sparingly. punkapi.com is rate-limited!
class PunkNativeContractTests: XCTestCase {
    var beerRepository: BeersRepository!

    override func setUp() {
        super.setUp()
        self.beerRepository = BeersRepository()
    }
    
    // MARK: - Tests

    func test_get_beers_no_parameters() async throws {
        try await runTest([])
    }
    
    func test_get_beers_page() async throws {
        try await runTest([.page(value: 2)])
    }
    
    func test_get_beers_per_page() async throws {
        try await runTest([.perPage(value: 50)])
    }
    
    func test_get_beers_abv_greater_than() async throws {
        try await runTest([.abvGreaterThan(value: 4.0)])
    }
    
    func test_get_beers_abv_less_than() async throws {
        try await runTest([.abvLessThan(value: 5.0)])
    }
    
    func test_get_beers_ibu_greater_than() async throws {
        try await runTest([.ibuGreaterThan(value: 10)])
    }
    
    func test_get_beers_ibu_less_than() async throws {
        try await runTest([.ibuLessThan(value: 50)])
    }
    
    func test_get_beers_ebc_greater_than() async throws {
        try await runTest([.ebcGreaterThan(value: 10)])
    }
    
    func test_get_beers_ebc_less_than() async throws {
        try await runTest([.ebcLessThan(value: 20)])
    }
    
    func test_get_beers_beer_name() async throws {
        try await runTest([.beerName(value: "buzz")])
    }
    
    func test_get_beers_yeast() async throws {
        try await runTest([.yeast(value: "american")])
    }
    
    func test_get_beers_brewed_before() async throws {
        try await runTest([.brewedBefore(value: Date())])
    }
    
    func test_get_beers_brewed_after() async throws {
        try await runTest([.brewedAfter(value: Date(timeIntervalSince1970: 0))])
    }
    
    func test_get_beers_hops() async throws {
        try await runTest([.hops(value: "first gold")])
    }
    
    func test_get_beers_malt() async throws {
        try await runTest([.malt(value: "pale")])
    }
    
    func test_get_beers_food() async throws {
        try await runTest([.food(value: "chicken")])
    }
    
    func test_get_beers_ids() async throws {
        try await runTest([.ids(values: ["1", "2", "3"])])
    }
    
    func test_get_beers_all_parameters() async throws {
        try await runTest([
            .page(value: 1),
            .perPage(value: 5),
            .abvGreaterThan(value: 4.0),
            .abvLessThan(value: 6.0),
            .ibuGreaterThan(value: 25),
            .ibuLessThan(value: 100),
            .ebcGreaterThan(value: 10),
            .ebcLessThan(value: 50),
            .beerName(value: "buzz"),
            .yeast(value: "american"),
            .brewedBefore(value: Date()),
            .brewedAfter(value: Date(timeIntervalSince1970: 0)),
            .hops(value: "first gold"),
            .malt(value: "pale"),
            .food(value: "chicken"),
            .ids(values: ["1", "2", "3"])
        ])
    }
                          
    // MARK: - Helper methods
    
    private func runTest(_ parameters: [BeersParameter]) async throws {
        guard #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) else {
            throw XCTSkip("Async/await not available, skipping test")
        }
        
        let beers = try await beerRepository.beers(parameters: [])
        XCTAssertFalse(beers.isEmpty)
    }
}
