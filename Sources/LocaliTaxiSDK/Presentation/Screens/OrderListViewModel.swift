import SwiftUI

@MainActor
public final class OrderListViewModel: ObservableObject {
    @Published public private(set) var orders: [TaxiOrder] = []
    @Published public private(set) var isLoading = false
    @Published public private(set) var error: String?

    private let repository: TaxiRepositoryProtocol

    public init(repository: TaxiRepositoryProtocol = TaxiRepository()) {
        self.repository = repository
    }

    public func loadOrders() async {
        isLoading = true
        error = nil

        do {
            orders = try await repository.getOrders()
        } catch {
            self.error = error.localizedDescription
        }

        isLoading = false
    }
}
