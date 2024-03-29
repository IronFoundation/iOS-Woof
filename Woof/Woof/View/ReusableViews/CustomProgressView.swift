import SwiftUI

/// A view representing a custom circular progress indicator.
struct CustomProgressView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(AppStyle.UIElementConstant.opacityLevelForProgressViewBackground)
            ProgressView()
        }
    }
}

#Preview {
    CustomProgressView()
}
