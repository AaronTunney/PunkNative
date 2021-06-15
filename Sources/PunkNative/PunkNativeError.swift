//
//  PunkNativeError.swift
//  PunkNative
//
//  Created by Aaron Tunney on 11/06/2021.
//

import Foundation

public enum PunkNativeError: Error {
    case unableToBuildURL
    case badResponse(error: Error?)
}

extension PunkNativeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToBuildURL:
            return "Unable to build URL"
        case .badResponse(let error):
            return "Bad response: \(error?.localizedDescription ?? "no description")"
        }
    }
}

extension PunkNativeError: Equatable {
    public static func == (lhs: PunkNativeError, rhs: PunkNativeError) -> Bool {
        switch (lhs, rhs) {
        case (.unableToBuildURL, .unableToBuildURL):
            return true
        case (let .badResponse(lhsError), let .badResponse(rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        default:
            return false
        }
    }
}
