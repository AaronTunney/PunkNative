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
    public let descriptionField: String?
    
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
    public let srm: Int?
    
    /// International Bitterness Units scale
    public let ibu: Int?
    
    /// Acidity of the beer
    public let ph: Float?
    
    /// How much sugar is left over when fermentation is done
    public let targetFg: Int?
    
    /// How much sugar is present in the wort before it is fermented
    public let targetOg: Int?
    
    /// The conversion of sugars into alcohol and carbon dioxide by the fermentation process
    public let attenuationLevel: Int?
    
    /// The amount of water
    public let boilVolume: BeerMeasurement?
    
    /// Brewer's tips
    public let brewersTips: String?
    
    /// Who contributed the recipe
    public let contributedBy: String?
    
    enum CodingKeys: String, CodingKey {
        case abv = "abv"
        case attenuationLevel = "attenuation_level"
        case boilVolume = "boil_volume"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
        case descriptionField = "description"
        case ebc = "ebc"
        case firstBrewed = "first_brewed"
        case foodPairing = "food_pairing"
        case ibu = "ibu"
        case id = "id"
        case imageUrl = "image_url"
        case ingredients = "ingredients"
        case method = "method"
        case name = "name"
        case ph = "ph"
        case srm = "srm"
        case tagline = "tagline"
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case volume = "volume"
    }
       
    /// Initializer used for decoding
    ///
    /// - Parameter decoder: The decoder to use
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        
        abv = try values.decodeIfPresent(Float.self, forKey: .abv)
        attenuationLevel = try values.decodeIfPresent(Int.self, forKey: .attenuationLevel)
        brewersTips = try values.decodeIfPresent(String.self, forKey: .brewersTips)
        contributedBy = try values.decodeIfPresent(String.self, forKey: .contributedBy)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        ebc = try values.decodeIfPresent(Int.self, forKey: .ebc)
        firstBrewed = try values.decodeIfPresent(Date.self, forKey: .firstBrewed)
        foodPairing = try values.decodeIfPresent([String].self, forKey: .foodPairing)
        ibu = try values.decodeIfPresent(Int.self, forKey: .ibu)
        ph = try values.decodeIfPresent(Float.self, forKey: .ph)
        srm = try values.decodeIfPresent(Int.self, forKey: .srm)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        targetFg = try values.decodeIfPresent(Int.self, forKey: .targetFg)
        targetOg = try values.decodeIfPresent(Int.self, forKey: .targetOg)
        
        if let imageStr = try values.decodeIfPresent(String.self, forKey: .imageUrl) {
            imageUrl = URL(string: imageStr)
        } else {
            imageUrl = nil
        }
        
        boilVolume = try values.decodeIfPresent(BeerMeasurement.self, forKey: .boilVolume)
        volume = try values.decodeIfPresent(BeerMeasurement.self, forKey: .volume)
        
        ingredients = try Ingredient(from: decoder)
        method = try BeerMethod(from: decoder)
    }

    /// Initialize `Beer` from parameters
    /// - Parameters:
    ///   - name: Beer name
    ///   - id: Unique beer identifier
    ///   - tagline: Beer tagline
    ///   - descriptionField: Beer description
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
         descriptionField: String?,
         imageUrl: URL?,
         ingredients: Ingredient?,
         method: BeerMethod?,
         volume: BeerMeasurement?,
         firstBrewed: Date?,
         foodPairing: [String]?,
         abv: Float?,
         ebc: Int?,
         srm: Int?,
         ibu: Int?,
         ph: Float?,
         targetFg: Int?,
         targetOg: Int?,
         attenuationLevel: Int?,
         boilVolume: BeerMeasurement?,
         brewersTips: String?,
         contributedBy: String?) {
        self.name = name
        self.id = id
        self.tagline = tagline
        self.descriptionField = descriptionField
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
                    descriptionField: "A beer for testing",
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
