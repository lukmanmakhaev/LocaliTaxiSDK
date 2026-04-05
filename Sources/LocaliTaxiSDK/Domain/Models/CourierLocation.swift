public struct CourierLocation: Equatable, Hashable, Sendable {
    public let latitude: Double
    public let longitude: Double
    public let course: Double

    public init(latitude: Double, longitude: Double, course: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.course = course
    }
}
