//
//  Hop.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing information on a hops ingredient
public struct Hop: Decodable {
    /// The name of the hops
    public let name: String
    
    /// Insturctions for adding the hops
    public let add: String?
    
    /// The amount to add
    public let amount: BeerMeasurement?
    
    /// The reason for adding the hops
    public let attribute: String?
}

let testHop = Hop(name: "Test Hops", add: "Start", amount: testMeasurement, attribute: "Bitter")
