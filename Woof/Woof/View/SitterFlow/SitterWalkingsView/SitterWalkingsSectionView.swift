import SwiftUI

/// Represents a section of walkings, with an expandable list of walkings.
struct SitterWalkingsSectionView: View {
    /// Control the expansion state of the walking list.
    @Binding var isExpanded: Bool

    /// Walkings that are displayed within this section.
    let walkings: [Walking]

    /// The title for the section header.
    let headerTitle: String

    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                ForEach(walkings) { walking in
                    NavigationLink {
                        Text(walking.id.uuidString)
                    } label: {
                        SitterWalkingCardView(
                            start: walking.start,
                            end: walking.end,
                            name: walking.owner?.name ?? "",
                            city: walking.owner?.city ?? "",
                            address: walking.owner?.address ?? "",
                            status: walking.status
                        )
                    }
                }
            },
            label: {
                Text(headerTitle)
                    .italic()
                    .foregroundColor(.App.purpleDark)
            }
        )
    }
}

#Preview {
    SitterWalkingsSectionView(
        isExpanded: .constant(true),
        walkings: Walking.Dummy.bulkDummyWalkings,
        headerTitle: "My Walkings"
    )
}
