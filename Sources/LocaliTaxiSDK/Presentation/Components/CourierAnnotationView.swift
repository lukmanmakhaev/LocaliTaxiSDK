import SwiftUI

struct CourierAnnotationView: View {
    let course: Double

    var body: some View {
        Image(systemName: "car.fill")
            .font(.title2)
            .foregroundColor(.white)
            .padding(8)
            .background(Circle().fill(Color.blue))
            .rotationEffect(.degrees(course))
            .shadow(radius: 4)
    }
}
