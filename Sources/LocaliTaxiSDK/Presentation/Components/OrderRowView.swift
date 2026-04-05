import SwiftUI

struct OrderRowView: View {
    let order: TaxiOrder

    var body: some View {
        HStack {
            Image(systemName: "car.fill")
                .foregroundColor(.blue)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text("Заказ #\(order.orderNumber)")
                    .font(.headline)
                Text(order.orderId)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
