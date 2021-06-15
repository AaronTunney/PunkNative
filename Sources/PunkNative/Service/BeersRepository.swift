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
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/yyyy"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    
    private let baseURL = "https://api.punkapi.com/v2/beers"

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func beers(parameters: [BeersParameter]) async throws -> [Beer] {
        let url = try buildURL(parameters: parameters)
        let (data, response) = try await session.data(from: url)
        try handleResponse(response: response)
        return try decoder.decode([Beer].self, from: data)
    }

    func beers(parameters: [BeersParameter]) -> AnyPublisher<[Beer], Error> {
        guard let url = try? buildURL(parameters: parameters) else {
            return Fail(error: PunkNativeError.unableToBuildURL)
                .eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { [weak self] data, response in
                try self?.handleResponse(response: response)
                return data
            }
            .decode(type: [Beer].self, decoder: decoder)
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
    
    private func handleResponse(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw PunkNativeError.badResponse(error: nil)
        }
        
        // Else return
    }
}
