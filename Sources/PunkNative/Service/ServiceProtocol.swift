//
//  ServiceProtocol.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation
import Combine

public protocol ServiceProtocol {
    func beers() async throws -> [Beer]
    func beers() -> AnyPublisher<[Beer], Error>
}
