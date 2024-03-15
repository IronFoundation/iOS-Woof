import SwiftUI

/// A view displaying information about the pet walkings.
struct OwnerWalkingsView: View {
    var futureWalkings = Walking.Dummy.bulkDummyWalkings
    var finishedWalkings = Walking.Dummy.bulkDummyWalkings

    var body: some View {
        NavigationView {
            ScrollView {
                WalkingsSectionView(
                    expandContent: $showAllFutureWalking,
                    walkings: futureWalkings,
                    headerTitle: futureWalkingSectionTitle
                )

                WalkingsSectionView(
                    expandContent: $showAllFinishedWalking,
                    walkings: finishedWalkings,
                    headerTitle: finishedWalkingSectionTitle
                )

                Spacer()
            }.padding()
                .listStyle(.plain)
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Private interface

    @State private var showAllFutureWalking = true
    @State private var showAllFinishedWalking = false

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
