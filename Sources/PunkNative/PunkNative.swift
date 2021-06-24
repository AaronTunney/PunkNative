import Foundation
import Combine

/// A native implementation of the Punk beer recipe API
///
/// Provides both async/await and Combine implementations.
public struct PunkNative {
    let service: BeersServiceProtocol
    
    /// Public initializer for the framework.
    ///
    /// - Parameter service: An optional beer service provider
    public init(service: BeersServiceProtocol? = nil) {
        if let service = service {
            self.service = service
        } else {
            self.service = BeersRepository()
        }
    }
    
    // MARK: - Async/await methods
    
    /// Get all beers that conform to the specified parameters.
    ///
    /// - Returns: An array of ``Beer`` structs
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func beers(parameters: [BeersParameter]) async throws -> [Beer] {
        return try await service.beers(parameters: parameters)
    }
    
    /// Get a random beer.
    ///
    /// - Returns: A ``Beer`` struct
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func randomBeer() async throws -> Beer {
        return try await service.randomBeer()
    }
    
    // MARK: - Combine methods
    
    /// Get all beers that conform to the specified parameters.
    ///
    /// - Returns: A generic publisher that will emit either an array of ``Beer`` structs
    ///            or an error.
    public func beers(parameters: [BeersParameter]) -> AnyPublisher<[Beer], Error> {
        return service.beers(parameters: parameters)
    }
    
    /// Get a random beer
    ///
    /// - Returns: A generic publisher that will emit either a ``Beer`` struct or an error.
    public func randomBeer() -> AnyPublisher<Beer, Error> {
        return service.randomBeer()
    }
}
