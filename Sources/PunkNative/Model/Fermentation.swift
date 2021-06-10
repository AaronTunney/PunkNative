//
//  Fermentation.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing the fermentation instuctions
public struct Fermentation: Decodable {
    
    /// The temperature for fermentation
    public let temp: Measurement?
}

let testFermentation = Fermentation(temp: testMeasurement)
