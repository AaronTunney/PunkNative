//
//  BeersRepository.swift
//  PunkNative
//
//  Created by Aaron Tunney on 10/06/2021.
//

import Foundation
import Combine

class BeersRepository: BeersServiceProtocol {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    private let decoder: JSONDecoder = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        
        let decode = JSONDecoder()
        decode.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decode
    }()
    
    private let baseURL = "https://api.punkapi.com/v2/beers"

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func beers(parameters: [BeersParameter]) async throws -> [Beer] {
        let url = try buildURL(parameters: parameters)
        let (data, _) = try await session.data(from: url)
        return try decoder.decode([Beer].self, from: data)
    }

    func beers(parameters: [BeersParameter]) -> AnyPublisher<[Beer], Error> {
        return PassthroughSubject<[Beer], Error>()
            .eraseToAnyPublisher()
    }
    
    private func buildURL(parameters: [BeersParameter]) throws -> URL {
        guard let url = URL(string: baseURL) else {
            throw PunkNativeError.unableToBuildURL
        }
        
        // If there's no parameters, return the base URL straight away
        if parameters.isEmpty {
            return url
        }
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw PunkNativeError.unableToBuildURL
        }
        
        components.queryItems = parameters.map { $0.queryItem }
        
        guard let finalURL = components.url else {
            throw PunkNativeError.unableToBuildURL
        }
        
        return finalURL
    }
}
