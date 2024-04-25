import SwiftUI

/// Presents the capsule label with the status.
/// Capsule color depends on the status value.
struct WalkingStatusLabel: View {
    /// Walking status to be shown.
    let status: WalkingStatus

    var body: some View {
        Text(status.rawValue)
            .bold()
            .font(.system(size: AppStyle.FontStyle.footnote.size))
            .padding(.horizontal)
            .foregroundColor(.App.white)
            .background(color)
            .clipShape(Capsule())
    }

    // MARK: - Private interface

    private var color: Color {
        switch status {
        case .available:
            Color.green
        case .pending:
            Color.orange
        case .booked:
            Color.cyan
        case .finished:
            Color.purple
        }
    }
}

#Preview {
    VStack {
        WalkingStatusLabel(status: .available)
        WalkingStatusLabel(status: .pending)
        WalkingStatusLabel(status: .booked)
        WalkingStatusLabel(status: .finished)
    }
}
