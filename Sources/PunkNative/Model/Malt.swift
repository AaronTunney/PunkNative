//
//  Malt.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing information on a malt ingredient
public struct Malt: Decodable {
    
    /// The name of the malt
    public let name: String
    
    /// The amount of malt to add
    public let amount: BeerMeasurement?
}

let testMalt = Malt(name: "Test Malt", amount: testMeasurement)
