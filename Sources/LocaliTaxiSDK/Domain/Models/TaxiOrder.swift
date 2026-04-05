public struct TaxiOrder: Equatable, Hashable, Sendable {
    public let orderId: String
    public let orderNumber: Int

    public init(orderId: String, orderNumber: Int) {
        self.orderId = orderId
        self.orderNumber = orderNumber
    }
}
