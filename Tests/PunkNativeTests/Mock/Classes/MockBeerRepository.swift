//
//  MockBeerRepository.swift
//  PunkNative
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import Combine
@testable import PunkNative

class MockBeerRepository: BeersServiceProtocol {
    enum State {
        case success
        case empty
        case error(error: Error)
    }
    
    var state: State = .success
    
    func beers(parameters: [BeersParameter]) async throws -> [Beer] {
        switch state {
        case .success:
            return [testBeer]
        case .empty:
            return []
        case .error(let error):
            throw error
        }
    }
    
    func beers(parameters: [BeersParameter]) -> AnyPublisher<[Beer], Error> {
        switch state {
        case .success:
            return Just([testBeer])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .empty:
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .error(let error):
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}
