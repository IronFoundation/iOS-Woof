import SwiftUI

/// A view displaying information about the pet walkings.
struct OwnerWalkingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                WalkingsSectionView(
                    expandContent: $showAllFutureWalking,
                    walkings: viewModel.futureWalkings,
                    headerTitle: futureWalkingSectionTitle
                )

                WalkingsSectionView(
                    expandContent: $showCurrentWalking,
                    walkings: viewModel.currentWalkings,
                    headerTitle: currentWalkingSectionTitle
                )

                WalkingsSectionView(
                    expandContent: $showAllFinishedWalking,
                    walkings: viewModel.finishedWalkings,
                    headerTitle: finishedWalkingSectionTitle
                )

                Spacer()
            }
            .overlay {
                if viewModel.isWalkingsLoading {
                    CustomProgressView()
                }
            }
            .padding()
            .listStyle(.plain)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                Task {
                    await viewModel.getWalkings()
                }
            }
        }
    }

    // MARK: - Private interface

    @State private var showAllFutureWalking = true
    @State private var showCurrentWalking = true
    @State private var showAllFinishedWalking = false
    @StateObject private var viewModel = OwnerWalkingsViewModel()

    private let futureWalkingSectionTitle = "Future walkings"
    private let currentWalkingSectionTitle = "Current walkings"
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
