import SwiftUI

/// A view displaying information about the pet walkings.
struct SitterWalkingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                SitterWalkingsSectionView(
                    isExpanded: $showAllFutureWalkings,
                    walkings: viewModel.futureWalkings,
                    headerTitle: futureWalkingSectionTitle
                )

                SitterWalkingsSectionView(
                    isExpanded: $showCurrentWalkings,
                    walkings: viewModel.currentWalkings,
                    headerTitle: currentWalkingSectionTitle
                )

                SitterWalkingsSectionView(
                    isExpanded: $showAllFinishedWalkings,
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

    @State private var showAllFutureWalkings = true
    @State private var showCurrentWalkings = true
    @State private var showAllFinishedWalkings = false

    @StateObject private var viewModel = SitterWalkingsViewModel()

    private let futureWalkingSectionTitle = "Future walkings"
    private let currentWalkingSectionTitle = "Current walkings"
    private let finishedWalkingSectionTitle = "Finished walkings"
    private let navigationTitle = "Walkings"
}

struct SitterWalkingsView_Previews: PreviewProvider {
    static var previews: some View {
        SitterWalkingsView()
    }
}
