import Foundation

/// The view model for a owner walkings view that is responsible for preparing and providing data for it.
final class SitterWalkingsViewModel: ObservableObject {
    /// The list of the future walkings to present
    @Published var futureWalkings: [Walking] = []
    /// The list of the current walkings to present
    @Published var currentWalkings: [Walking] = []
    /// The list of the past walkings to present
    @Published var finishedWalkings: [Walking] = []
    /// Indicates if loading data is in progress.
    @Published var isWalkingsLoading = false

    init() {
        Task {
            await getWalkings()
        }
    }

    /// Fetches data about walkings.
    @MainActor func getWalkings() async {
        isWalkingsLoading = true
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        walkings = Walking.Dummy.bulkDummyWalkings
        isWalkingsLoading = false
    }

    private var walkings: [Walking] = [] {
        didSet {
            futureWalkings = []
            currentWalkings = []
            finishedWalkings = []

            for walking in walkings {
                if walking.start >= .now {
                    futureWalkings.append(walking)
                } else if walking.start <= .now && walking.end > .now {
                    currentWalkings.append(walking)
                } else {
                    finishedWalkings.append(walking)
                }
            }
        }
    }
}
