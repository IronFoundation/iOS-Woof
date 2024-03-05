import SwiftUI

struct WalkingSlotsView: View {
    @Binding var walkings: [Walking]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: AppStyle.UIElementConstant.wideSpacingSize) {
                ForEach(walkings) { walking in
                    NavigationLink {
                        Text(walking.sitter.name)
                    } label: {
                        WalkingSlotCardView(
                            price: walking.price,
                            startDate: walking.start,
                            endDate: walking.end
                        )
                    }
                }
            }
        }
    }

    private let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]
}

#Preview {
    WalkingSlotsView(walkings: .constant(Walking.Dummy.bulkDummyWalkings))
}
