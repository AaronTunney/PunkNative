//
//  File.swift
//  
//
//  Created by Aaron on 11/06/2021.
//

import Foundation

public enum BeerParameter {
    /// Returns the numbered page of results
    case page(value: Int)
    
    /// Returns a maxium of _n_ of results
    case perPage(value: Int)
    
    /// Returns all beers with ABV greater than the supplied number
    case abvGreaterThan(value: Float)
    
    /// Returns all beers with ABV less than the supplied number
    case abvLessThan(value: Float)
    
    /// Returns all beers with IBU greater than the supplied number
    case ibuGreaterThan(value: Float)
    
    /// Returns all beers with IBU less than the supplied number
    case ibuLessThan(value: Float)
    
    /// Returns all beers with EBC greater than the supplied number
    case ebcGreaterThan(value: Float)
    
    /// Returns all beers with EBC less than the supplied number
    case ebcLessThan(value: Float)
    
    /// Returns all beers matching the supplied name (this will match partial strings as well so e.g punk will return Punk IPA)
    case beerName(value: String)
    
    /// Returns all beers matching the supplied yeast name, this performs a fuzzy match.
    case yeast(value: String)
    
    /// Returns all beers brewed before this date, the date format is mm-yyyy e.g 10-2011
    case brewedBefore(value: Date)
    
    /// Returns all beers brewed after this date, the date format is mm-yyyy e.g 10-2011
    case brewedAfter(value: Date)
    
    /// Returns all beers matching the supplied hops name, this performs a fuzzy match.
    case hops(value: String)
    
    /// Returns all beers matching the supplied malt name, this performs a fuzzy match.
    case malt(value: String)
    
    /// Returns all beers matching the supplied food string, this performs a fuzzy match.
    case food(value: String)
    
    /// Returns all beers matching the supplied ID's.
    case ids(values: [String])
}

extension BeerParameter {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: name, value: value)
    }
    
    private var name: String {
        switch self {
        case .page:
            return "page"
        case .perPage:
            return "per_page"
        case .abvGreaterThan:
            return "abv_gt"
        case .abvLessThan:
            return "abv_lt"
        case .ibuGreaterThan:
            return "ibu_gt"
        case .ibuLessThan:
            return "ibu_lt"
        case .ebcGreaterThan:
            return "ebc_gt"
        case .ebcLessThan:
            return "ebc_lt"
        case .beerName:
            return "beer_name"
        case .yeast:
            return "yeast"
        case .brewedBefore:
            return "brewed_before"
        case .brewedAfter:
            return "brewed_after"
        case .hops:
            return "hops"
        case .malt:
            return "malt"
        case .food:
            return "food"
        case .ids:
            return "ids"
        }
    }
    
    private var value: String {
        switch self {
        case .page(let value),
                .perPage(let value):
            return String(format: "%d", value)
            
        case .abvGreaterThan(let value),
                .abvLessThan(let value),
                .ibuGreaterThan(let value),
                .ibuLessThan(let value),
                .ebcGreaterThan(let value),
                .ebcLessThan(let value):
            return String(format: "%0.2f", value)
            
        case .beerName(let value),
                .yeast(let value),
                .hops(let value),
                .malt(let value),
                .food(let value):
            return value.replacingOccurrences(of: " ", with: "_")
            
        case .brewedBefore(let value),
                .brewedAfter(let value):
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/yyyy"
            return dateFormatter.string(from: value)
            
        case .ids(let values):
            return values.joined(separator: "|")
        }
    }
}
