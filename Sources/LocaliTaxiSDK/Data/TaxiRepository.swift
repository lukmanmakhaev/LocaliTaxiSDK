import Foundation
import TaxiShared

public final class TaxiRepository: TaxiRepositoryProtocol {
    public init() {}

    public func getOrders() async throws -> [TaxiOrder] {
        let orders = try await TaxiSdk.companion.instance.orders.getAll()

        return orders.map {
            TaxiOrder(
                orderId: $0.orderId,
                orderNumber: Int($0.orderNum)
            )
        }
    }
}
