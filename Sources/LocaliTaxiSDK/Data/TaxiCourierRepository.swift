import Foundation
import TaxiShared

public final class TaxiCourierRepository: CourierLocationProtocol {
    public init() {}

    public func observeCourierLocation(orderId: String) -> AsyncStream<CourierLocation> {
        let flow = TaxiSdk.companion.instance.courier.observeLocation(orderId: orderId)

        return AsyncStream { continuation in
            nonisolated(unsafe) let flow = flow
            let task = Task {
                for await location in flow {
                    continuation.yield(
                        CourierLocation(
                            latitude: location.latitude,
                            longitude: location.longitude,
                            course: location.course
                        )
                    )
                }
                continuation.finish()
            }
            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }
}
