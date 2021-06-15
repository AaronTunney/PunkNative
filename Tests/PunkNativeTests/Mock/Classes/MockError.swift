//
//  MockError.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation

enum MockError: Error, Equatable {
    case genericError
}

extension MockError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .genericError:
            return "Generic mock error"
        }
    }
}
