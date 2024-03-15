import SwiftUI

struct WalkingStatusLabel: View {
    let status: WalkingStatus

    var body: some View {
        Text(status.rawValue)
            .bold()
            .padding(.horizontal)
            .foregroundColor(.App.white)
            .background(content: {
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
            })
            .clipShape(Capsule())
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
