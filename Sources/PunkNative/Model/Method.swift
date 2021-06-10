//
//  Method.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing a brewing method
public struct Method: Decodable {
    
    /// The fermentation temperature
    public let fermentation: Fermentation?
    
    /// The mash temperature(s)
    public let mashTemp: [MashTemp]?
    
    /// Any addition information
    public let twist: String?
}

let testMethod = Method(fermentation: testFermentation, mashTemp: [testMashTemp], twist: "The twist")
