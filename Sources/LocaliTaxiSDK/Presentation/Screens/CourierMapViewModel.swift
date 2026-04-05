import SwiftUI
import MapKit

public struct CourierAnnotationItem: Identifiable {
    public let id = "courier"
    public let coordinate: CLLocationCoordinate2D
    public let course: Double
}

@MainActor
public final class CourierMapViewModel: ObservableObject {
    @Published public private(set) var courierCoordinate: CLLocationCoordinate2D?
    @Published public private(set) var courierCourse: Double = 0
    @Published public private(set) var isConnected = false

    public var annotations: [CourierAnnotationItem] {
        guard let coordinate = courierCoordinate else { return [] }
        return [CourierAnnotationItem(coordinate: coordinate, course: courierCourse)]
    }

    public let order: TaxiOrder
    private let courierRepository: CourierLocationProtocol
    private var observationTask: Task<Void, Never>?

    public init(
        order: TaxiOrder,
        courierRepository: CourierLocationProtocol = TaxiCourierRepository()
    ) {
        self.order = order
        self.courierRepository = courierRepository
    }

    public func startObserving() {
        stopObserving()

        observationTask = Task {
            isConnected = true

            let stream = courierRepository.observeCourierLocation(orderId: order.orderId)
            for await location in stream {
                courierCoordinate = CLLocationCoordinate2D(
                    latitude: location.latitude,
                    longitude: location.longitude
                )
                courierCourse = location.course
            }

            isConnected = false
        }
    }

    public func stopObserving() {
        observationTask?.cancel()
        observationTask = nil
        isConnected = false
    }
}
