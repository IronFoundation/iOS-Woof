import SwiftUI

/// A view presents the information related to booking process.
struct BookingSlotView: View {
    var body: some View {
        Text(walkingsSlotStubText)
    }

    // MARK: - Private interface

    private let walkingsSlotStubText = "Walkings slot stub"
}

#Preview {
    BookingSlotView()
}
