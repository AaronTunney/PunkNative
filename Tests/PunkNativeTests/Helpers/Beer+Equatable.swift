//
//  Beer+Equatable.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import PunkNative

extension Beer: Equatable {
    public static func == (lhs: Beer, rhs: Beer) -> Bool {
        return lhs.name == rhs.name &&
               lhs.imageUrl == rhs.imageUrl &&
               lhs.boilVolume == rhs.boilVolume &&
               lhs.abv == rhs.abv &&
               lhs.attenuationLevel == rhs.attenuationLevel &&
               lhs.brewersTips == rhs.brewersTips &&
               lhs.contributedBy == rhs.contributedBy &&
               lhs.description == rhs.description &&
               lhs.ebc == rhs.ebc &&
               lhs.firstBrewed == rhs.firstBrewed &&
               lhs.foodPairing == rhs.foodPairing &&
               lhs.ibu == rhs.ibu &&
               lhs.id == rhs.id &&
               lhs.ingredients == rhs.ingredients &&
               lhs.method == rhs.method &&
               lhs.ph == rhs.ph &&
               lhs.srm == rhs.srm &&
               lhs.tagline == rhs.tagline &&
               lhs.targetFg == rhs.targetFg &&
               lhs.targetOg == rhs.targetOg
    }
}

extension Fermentation: Equatable {
    public static func == (lhs: Fermentation, rhs: Fermentation) -> Bool {
        return lhs.temp == rhs.temp
    }
}

extension Hop: Equatable {
    public static func == (lhs: Hop, rhs: Hop) -> Bool {
        return lhs.name == rhs.name &&
               lhs.add == rhs.add &&
               lhs.amount == rhs.amount &&
               lhs.attribute == rhs.attribute
    }
}

extension Ingredient: Equatable {
    public static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.hops == rhs.hops &&
               lhs.malt == rhs.malt &&
               lhs.yeast == rhs.yeast
    }
}

extension Malt: Equatable {
    public static func == (lhs: Malt, rhs: Malt) -> Bool {
        return lhs.amount == rhs.amount &&
               lhs.name == rhs.name
    }
}

extension MashTemp: Equatable {
    public static func == (lhs: MashTemp, rhs: MashTemp) -> Bool {
        return lhs.temp == rhs.temp &&
               lhs.duration == rhs.duration
    }
}

extension BeerMeasurement: Equatable {
    public static func == (lhs: BeerMeasurement, rhs: BeerMeasurement) -> Bool {
        return lhs.unit == rhs.unit &&
               lhs.value == rhs.value
    }
}

extension BeerMethod: Equatable {
    public static func == (lhs: BeerMethod, rhs: BeerMethod) -> Bool {
        return lhs.fermentation == rhs.fermentation &&
               lhs.mashTemp == rhs.mashTemp &&
               lhs.twist == rhs.twist
    }
}
