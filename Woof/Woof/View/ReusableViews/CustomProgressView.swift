import SwiftUI

/// /// A view representing a custom circular progress indicator.
struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }
}

#Preview {
    CustomProgressView()
}
