import SwiftUI

/// Represents a section of walkings, with an expandable list of walkings.
struct SitterWalkingsSectionView: View {
    /**
     Initialize the new instance of `SitterWalkingsSectionView`.

     - Parameters:
     - isExpanded: control the expansion state of the walking list.
     - walkings: the walking to be displayed within this section.
     - headerTitle: the title for the section header.
     */

    init(
        isExpanded: Bool,
        walkings: [Walking],
        headerTitle: String
    ) {
        self.isExpanded = isExpanded
        self.walkings = walkings
        self.headerTitle = headerTitle
    }

    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                ForEach(walkings) { walking in
                    NavigationLink {
                        Text(walking.id.uuidString)
                    } label: {
                        SitterWalkingCardView(
                            viewModel: SitterWalkingCardViewModel(
                                walking: walking
                            )
                        )
                    }
                }
            },
            label: {
                Text(headerTitle)
                    .bold()
                    .italic()
                    .foregroundColor(.App.purpleDark)
            }
        )
    }

    // MARK: - Private interface

    @State private var isExpanded: Bool
    private let walkings: [Walking]
    private let headerTitle: String
}

#Preview {
    SitterWalkingsSectionView(
        isExpanded: true,
        walkings: Walking.Dummy.bulkDummyWalkings,
        headerTitle: "My Walkings"
    )
}
