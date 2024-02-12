import SwiftUI

struct WalkingStatusLabel: View {
    let status: WalkingStatus

    private var color: Color {
        switch status {
        case .available:
            return .green
        case .pending:
            return .yellow
        case .booked:
            return .indigo
        case .finished:
            return .orange
        case .canceledBySitter:
            return .red
        }
    }

    var body: some View {
        Text(status.rawValue)
            .font(
                .system(
                    size: AppStyle.FontStyle.body.size,
                    weight: .heavy
                )
            )
            .foregroundColor(.App.white)
            .padding(.horizontal)
            .background(color.opacity(0.65))
            .clipShape(Capsule())
    }
}

#Preview {
    WalkingStatusLabel(status: .available)
}
