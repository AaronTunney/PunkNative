//
//  BeersServiceProtocol.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation
import Combine

/// Protocol for service that returns beer recipe information
public protocol BeersServiceProtocol {
    
    /// A list of beer recipes, using the async/await pattern
    ///
    /// - Returns: An array of beer recipes
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func beers(parameters: [BeersParameter]) async throws -> [Beer]
    
    /// A list of beer recipes, using the Combine pattern
    ///
    /// - Returns: A generic publisher, returning either an array of
    ///            beer recipes or an error.
    func beers(parameters: [BeersParameter]) -> AnyPublisher<[Beer], Error>
}
