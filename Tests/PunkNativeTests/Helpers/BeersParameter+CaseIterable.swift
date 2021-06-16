//
//  BeersParameter+CaseIterable.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 16/06/2021.
//

import Foundation
import PunkNative

extension BeersParameter: CaseIterable {
    public static var allCases: [BeersParameter] {
        return [
            .page(value: 5),
            .perPage(value: 5),
            .abvGreaterThan(value: 5.6),
            .abvLessThan(value: 5.6),
            .ibuGreaterThan(value: 5.6),
            .ibuLessThan(value: 5.6),
            .ebcGreaterThan(value: 5.6),
            .ebcLessThan(value: 5.6),
            .beerName(value: "test string"),
            .yeast(value: "test string"),
            .brewedBefore(value: Date(timeIntervalSince1970: 0)),
            .brewedAfter(value: Date(timeIntervalSince1970: 0)),
            .hops(value: "test string"),
            .malt(value: "test string"),
            .food(value: "test string"),
            .ids(values: ["1", "2", "3"])
        ]
    }
}
