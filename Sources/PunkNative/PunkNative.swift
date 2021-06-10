import Foundation
public struct PunkNative {
    let service: ServiceProtocol
    
    public init(service: ServiceProtocol? = nil) {
        if let service = service {
            self.service = service
        } else {
            self.service = ServiceRepository()
        }
    }
    
    public func beers() async throws -> [Beer] {
        return try await service.beers()
    }
}
