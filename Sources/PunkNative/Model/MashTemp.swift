//
//  MashTemp.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing the mash temperature
public struct MashTemp: Decodable {
    
    /// Duration, expressed in minutes
    public let duration: Int?
    
    /// The temperature
    public let temp: BeerMeasurement?
}

let testMashTemp = MashTemp(duration: 60, temp: testMeasurement)
