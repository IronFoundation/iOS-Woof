import SwiftUI

struct WalkingsSectionView: View {
    @Binding var expandContent: Bool
    let walkings: [Walking]
    let headerTitle: String

    var body: some View {
        DisclosureGroup(
            isExpanded: $expandContent,
            content: {
                ForEach(walkings) { walking in
                    NavigationLink {
                        OwnerDetailedWalkingView(walking: walking)
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
        expandContent: .constant(true),
        walkings: Walking.Dummy.bulkDummyWalkings,
        headerTitle: "Some walkings"
    )
}
