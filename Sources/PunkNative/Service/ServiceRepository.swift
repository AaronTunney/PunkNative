//
//  ServiceRepository.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation
import Combine

struct ServiceRepository: ServiceProtocol {
    func beers() async throws -> [Beer] {
        return []
    }
    
    func beers() -> AnyPublisher<[Beer], Error> {
        return Fail(error: URLError.unknown)
    }
}
