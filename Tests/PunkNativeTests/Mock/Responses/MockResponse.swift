//
//  MockResponse.swift
//  PunkNativeTests
//
//  Created by Aaron Tunney on 13/06/2021.
//

import Foundation
import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift

extension XCTestCase {
    func addSuccessStub() {
        stub(condition: isHost("api.punkapi.com")) { request in
            let stubPath = Bundle.module.path(forResource: "success", ofType: "json")!
            return HTTPStubsResponse(fileAtPath: stubPath, statusCode: 200, headers: nil)
        }
    }
    
    func addEmptyStub() {
        stub(condition: isHost("api.punkapi.com")) { request in
            let stubPath = Bundle.module.path(forResource: "empty", ofType: "json")!
            return HTTPStubsResponse(fileAtPath: stubPath, statusCode: 200, headers: nil)
        }
    }
    
    func addNotFoundErrorStub() {
        stub(condition: isHost("api.punkapi.com")) { request in
            return HTTPStubsResponse(data: Data(),
                                     statusCode: 404,
                                     headers: nil)
        }
    }
    
    func removeStubs() {
        HTTPStubs.removeAllStubs()
    }
}
