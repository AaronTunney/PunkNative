//
//  BeerMeasurement.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing a measurement, expressed as a value and its units
public struct BeerMeasurement: Decodable {
    
    /// The unit of measurement (e.g. litres, grams, etc)
    public let unit: String?
    
    /// The measurement
    public let value: Float?
}

let testMeasurement = BeerMeasurement(unit: "ml", value: 100)
