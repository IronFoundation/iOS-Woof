import SwiftUI

/// A view presents the information related to booking process.
struct BookingSlotView: View {
    /// The walking that will be booked.
    let walking: Walking

    var body: some View {
        Text(walking.sitter.name)
    }
}

#Preview {
    BookingSlotView(walking: Walking.Dummy.dummyWalking)
}
