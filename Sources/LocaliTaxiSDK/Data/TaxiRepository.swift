import Foundation
import TaxiShared

public final class TaxiRepository: TaxiRepositoryProtocol {
    public init() {}

    public func getOrders() async throws -> [TaxiOrder] {
        print("🔍 TaxiSdk instance: \(TaxiSdk.companion.instance)")

        let orders = try await TaxiSdk.companion.instance.orders.getAll()

        return orders.map {
            TaxiOrder(
                orderId: $0.orderId,
                orderNumber: Int($0.orderNum)
            )
        }
    }
}
