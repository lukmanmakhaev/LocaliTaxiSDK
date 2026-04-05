import Foundation

public protocol CourierLocationProtocol: Sendable {
    func observeCourierLocation(orderId: String) -> AsyncStream<CourierLocation>
}
