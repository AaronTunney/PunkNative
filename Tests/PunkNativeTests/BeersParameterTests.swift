//
//  File.swift
//  
//
//  Created by Aaron on 16/06/2021.
//

import Foundation
import XCTest
@testable import PunkNative

class BeersParameterTests: XCTestCase {
    let testFloat = "5.60"
    let testInt = "5"
    let testString = "test_string"
    let testDate = "01/1970"
    let testIDs = "1|2|3"
    
    func test_all_parameters_convert_to_query_item() {
        BeersParameter.allCases.forEach { parameter in
            let queryItem = parameter.queryItem
            
            switch parameter {
            case .page:
                XCTAssertEqual(queryItem.name, "page")
                XCTAssertEqual(queryItem.value, testInt)
            case .perPage:
                XCTAssertEqual(queryItem.name, "per_page")
                XCTAssertEqual(queryItem.value, testInt)
            case .abvGreaterThan:
                XCTAssertEqual(queryItem.name, "abv_gt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .abvLessThan:
                XCTAssertEqual(queryItem.name, "abv_lt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .ibuGreaterThan:
                XCTAssertEqual(queryItem.name, "ibu_gt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .ibuLessThan:
                XCTAssertEqual(queryItem.name, "ibu_lt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .ebcGreaterThan:
                XCTAssertEqual(queryItem.name, "ebc_gt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .ebcLessThan:
                XCTAssertEqual(queryItem.name, "ebc_lt")
                XCTAssertEqual(queryItem.value, testFloat)
            case .beerName:
                XCTAssertEqual(queryItem.name, "beer_name")
                XCTAssertEqual(queryItem.value, testString)
            case .yeast:
                XCTAssertEqual(queryItem.name, "yeast")
                XCTAssertEqual(queryItem.value, testString)
            case .brewedBefore:
                XCTAssertEqual(queryItem.name, "brewed_before")
                XCTAssertEqual(queryItem.value, testDate)
            case .brewedAfter:
                XCTAssertEqual(queryItem.name, "brewed_after")
                XCTAssertEqual(queryItem.value, testDate)
            case .hops:
                XCTAssertEqual(queryItem.name, "hops")
                XCTAssertEqual(queryItem.value, testString)
            case .malt:
                XCTAssertEqual(queryItem.name, "malt")
                XCTAssertEqual(queryItem.value, testString)
            case .food:
                XCTAssertEqual(queryItem.name, "food")
                XCTAssertEqual(queryItem.value, testString)
            case .ids:
                XCTAssertEqual(queryItem.name, "ids")
                XCTAssertEqual(queryItem.value, testIDs)
            }
        }
    }
}
