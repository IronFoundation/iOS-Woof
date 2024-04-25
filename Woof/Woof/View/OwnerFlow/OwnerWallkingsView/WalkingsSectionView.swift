import SwiftUI

/// Represents a section of walkings, with an expandable list of walkings.
struct WalkingsSectionView: View {
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
                        Text(walking.sitter.name)
                    } label: {
                        OwnerWalkingCardView(walking: walking)
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
    WalkingsSectionView(
        isExpanded: .constant(true),
        walkings: Walking.Dummy.bulkDummyWalkings,
        headerTitle: "Some walkings"
    )
}