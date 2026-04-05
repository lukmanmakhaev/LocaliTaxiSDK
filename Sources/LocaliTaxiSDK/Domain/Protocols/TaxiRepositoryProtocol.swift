import Foundation

public protocol TaxiRepositoryProtocol: Sendable {
    func getOrders() async throws -> [TaxiOrder]
}
