import SwiftUI

/// The view presents a grid of walking slots with associated booking information.
struct WalkingSlotsView: View {
    /// The list of walkings to present.
    @Binding var walkings: [Walking]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: AppStyle.UIElementConstant.wideSpacingSize
            ) {
                ForEach(walkings) { walking in
                    NavigationLink {
                        BookingSlotView(viewModel: BookingSlotViewModel(walking: walking))
                    } label: {
                        WalkingSlotCardView(
                            price: walking.price,
                            startDate: walking.start,
                            endDate: walking.end
                        ).font(
                            .system(
                                size: AppStyle.FontStyle.footnote.size
                            )
                        )
                    }
                }
            }
        }
    }

    // MARK: - Private interface

    private let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]
}

#Preview {
    WalkingSlotsView(walkings: .constant(Walking.Dummy.bulkDummyWalkings))
}
