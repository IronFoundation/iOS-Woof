import SwiftUI

/// A view displaying information about the pet walkings.
struct OwnerWalkingsView: View {
    var futureWalkings = Walking.Dummy.bulkDummyWalkings
    var finishedWalkings = Walking.Dummy.bulkDummyWalkings

    var body: some View {
        List {
            Section(futureWalkingSectionTitle) {
                ForEach(futureWalkings) { walking in
                    NavigationLink {
                        OwnerDetailedWalkingView(walking: walking)
                    } label: {
                        OwnerWalkingCardView(walking: walking)
                    }
                }
            }
            Section(finishedWalkingSectionTitle) {
                ForEach(finishedWalkings) { walking in
                    NavigationLink {
                        OwnerDetailedWalkingView(walking: walking)
                    } label: {
                        OwnerWalkingCardView(walking: walking)
                    }
                }
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Private interface

    private let futureWalkingSectionTitle = "Future walkings"
    private let finishedWalkingSectionTitle = "Finished walkings"
    private let navigationTitle = "Walkings"
}

struct OwnerWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OwnerWalkingsView()
        }
    }
}
