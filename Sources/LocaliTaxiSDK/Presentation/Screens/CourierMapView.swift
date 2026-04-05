import SwiftUI
import MapKit

public struct CourierMapView: View {
    @StateObject private var viewModel: CourierMapViewModel

    public init(viewModel: CourierMapViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack(alignment: .top) {
            mapContent

            if !viewModel.isConnected && viewModel.courierCoordinate == nil {
                statusOverlay
            }
        }
        .navigationTitle("Заказ #\(viewModel.order.orderNumber)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { viewModel.startObserving() }
        .onDisappear { viewModel.stopObserving() }
    }

    private var mapContent: some View {
        Map(
            coordinateRegion: .constant(region),
            annotationItems: viewModel.annotations
        ) { item in
            MapAnnotation(coordinate: item.coordinate) {
                CourierAnnotationView(course: item.course)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }

    private var region: MKCoordinateRegion {
        if let coordinate = viewModel.courierCoordinate {
            return MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        }
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 55.75, longitude: 37.62),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }

    private var statusOverlay: some View {
        HStack(spacing: 8) {
            ProgressView()
            Text("Подключение...")
                .font(.subheadline)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: Capsule())
        .padding(.top, 8)
    }
}
