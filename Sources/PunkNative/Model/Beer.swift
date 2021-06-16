//
//  Beer.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation

/// A struct containing the recipe for a beer
public struct Beer: Decodable {
    
    /// Beer name
    public let name: String
    
    /// Unique beer identifier
    public let id: Int
    
    /// Beer tagline
    public let tagline: String?
    
    /// Beer description
    public let description: String?
    
    /// Beer image URL
    public let imageUrl: URL?
    
    /// Recipe ingredients
    public let ingredients: Ingredient?
    
    /// Recipe method
    public let method: BeerMethod?
    
    /// Volume of beer created
    public let volume: BeerMeasurement?
    
    /// Date first brewed
    public let firstBrewed: Date?

    /// Food pairing suggestions
    public let foodPairing: [String]?
    
    /// Alcohol by volume (%)
    public let abv: Float?
    
    /// Beer color (European units)
    public let ebc: Int?
    
    /// Beer color (American units)
    public let srm: Float?
    
    /// International Bitterness Units scale
    public let ibu: Float?
    
    /// Acidity of the beer
    public let ph: Float?
    
    /// How much sugar is left over when fermentation is done
    public let targetFg: Float?
    
    /// How much sugar is present in the wort before it is fermented
    public let targetOg: Float?
    
    /// The conversion of sugars into alcohol and carbon dioxide by the fermentation process
    public let attenuationLevel: Float?
    
    /// The amount of water
    public let boilVolume: BeerMeasurement?
    
    /// Brewer's tips
    public let brewersTips: String?
    
    /// Who contributed the recipe
    public let contributedBy: String?

    /// Initialize `Beer` from parameters
    /// - Parameters:
    ///   - name: Beer name
    ///   - id: Unique beer identifier
    ///   - tagline: Beer tagline
    ///   - description: Beer description
    ///   - imageUrl: Beer image URL
    ///   - ingredients: Recipe ingredients
    ///   - method: Recipe method
    ///   - volume: Volume of beer created
    ///   - firstBrewed: Date first brewed
    ///   - foodPairing: Food pairing suggestions
    ///   - abv: Alcohol by volume (%)
    ///   - ebc: Beer color (European units)
    ///   - srm: Beer color (American units)
    ///   - ibu: International Bitterness Units scale
    ///   - ph: Acidity of the beer
    ///   - targetFg: How much sugar is left over when fermentation is done
    ///   - targetOg: How much sugar is present in the wort before it is fermented
    ///   - attenuationLevel: The conversion of sugars into alcohol and carbon dioxide by the fermentation process
    ///   - boilVolume: The amount of water
    ///   - brewersTips: Brewer's tips
    ///   - contributedBy: Who contributed the recipe
    init(name: String,
         id: Int,
         tagline: String?,
         description: String?,
         imageUrl: URL?,
         ingredients: Ingredient?,
         method: BeerMethod?,
         volume: BeerMeasurement?,
         firstBrewed: Date?,
         foodPairing: [String]?,
         abv: Float?,
         ebc: Int?,
         srm: Float?,
         ibu: Float?,
         ph: Float?,
         targetFg: Float?,
         targetOg: Float?,
         attenuationLevel: Float?,
         boilVolume: BeerMeasurement?,
         brewersTips: String?,
         contributedBy: String?) {
        self.name = name
        self.id = id
        self.tagline = tagline
        self.description = description
        self.imageUrl = imageUrl
        self.ingredients = ingredients
        self.method = method
        self.volume = volume
        self.firstBrewed = firstBrewed
        self.foodPairing = foodPairing
        self.abv = abv
        self.ebc = ebc
        self.srm = srm
        self.ibu = ibu
        self.ph = ph
        self.targetFg = targetFg
        self.targetOg = targetOg
        self.attenuationLevel = attenuationLevel
        self.boilVolume = boilVolume
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
}

let testBeer = Beer(name: "Test Beer",
                    id: 1,
                    tagline: "This is the test beer",
                    description: "A beer for testing",
                    imageUrl: nil,
                    ingredients: testIngredient,
                    method: testMethod,
                    volume: testMeasurement,
                    firstBrewed: Date(timeIntervalSince1970: 0),
                    foodPairing: ["Fish"],
                    abv: 5.0,
                    ebc: 12,
                    srm: 12,
                    ibu: 1,
                    ph: 7.0,
                    targetFg: 80,
                    targetOg: 100,
                    attenuationLevel: 1,
                    boilVolume: testMeasurement,
                    brewersTips: "Don't make this beer",
                    contributedBy: "Bob")
