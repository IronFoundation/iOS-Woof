import SwiftUI

struct WalkingSlotsSection: View {
    let walkings: [Walking]

    var body: some View {
        Section {
            ForEach(walkings) { walking in
                NavigationLink {
                    BookingWalkingView(walking: walking)
                } label: {
                    WalkingSlotOneLineView(
                        price: walking.price,
                        startDate: walking.start,
                        endDate: walking.end
                    )
                }
            }.listStyle(.plain)
        } header: {
            Text("Available slots")
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)
        }
    }
}

#Preview {
    WalkingSlotsSection(walkings: Walking.Dummy.bulkDummyWalkings)
}
