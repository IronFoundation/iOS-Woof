import Foundation

/// The view model for a owner walkings view that is responsible for preparing and providing data for it.
final class OwnerWalkingsViewModel: ObservableObject {
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
            futureWalkings = walkings.filter { $0.start >= Date.now }
            currentWalkings = walkings.filter { $0.start <= Date.now && $0.end > Date.now }
            finishedWalkings = walkings.filter { $0.end <= Date.now }
        }
    }
}
