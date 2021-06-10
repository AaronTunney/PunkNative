//
//  Ingredient.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing an ingredient
public struct Ingredient: Decodable {
    
    /// An array of hops
    public let hops: [Hop]?
    
    /// An array of malts
    public let malt: [Malt]?
    
    /// The yeast
    public let yeast: String?
}

let testIngredient = Ingredient(hops: [testHop], malt: [testMalt], yeast: "Test Yeast")
