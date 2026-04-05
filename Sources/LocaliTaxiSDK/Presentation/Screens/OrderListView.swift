import SwiftUI

public struct OrderListView: View {
    @StateObject private var viewModel: OrderListViewModel
    private let onOrderSelected: (TaxiOrder) -> Void

    public init(
        viewModel: OrderListViewModel = OrderListViewModel(),
        onOrderSelected: @escaping (TaxiOrder) -> Void = { _ in }
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.onOrderSelected = onOrderSelected
    }

    public var body: some View {
        Group {
            if viewModel.isLoading && viewModel.orders.isEmpty {
                ProgressView("Загрузка заказов...")
            } else if let error = viewModel.error, viewModel.orders.isEmpty {
                errorView(message: error)
            } else {
                orderList
            }
        }
        .navigationTitle("Заказы")
        .task {
            await viewModel.loadOrders()
        }
        .refreshable {
            await viewModel.loadOrders()
        }
    }

    private var orderList: some View {
        List(viewModel.orders, id: \.orderId) { order in
            OrderRowView(order: order)
                .contentShape(Rectangle())
                .onTapGesture {
                    onOrderSelected(order)
                }
        }
        .listStyle(.plain)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.secondary)
            Text(message)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            Button("Повторить") {
                Task { await viewModel.loadOrders() }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
