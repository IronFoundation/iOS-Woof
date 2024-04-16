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
        var newWalkings: [Walking]
        if walkings.isEmpty {
            newWalkings = Walking.Dummy.bulkDummyWalkings
        } else {
            let newWalking = Walking.Dummy.dummyWalking
            newWalkings = walkings
            newWalkings.append(newWalking)
        }
        walkings = newWalkings

        isWalkingsLoading = false
    }

    private var walkings: [Walking] = [] {
        didSet {
            var future = [Walking]()
            var current = [Walking]()
            var finished = [Walking]()
            
            for walking in walkings {
                if walking.start >= .now {
                    future.append(walking)
                } else if walking.start <= .now && walking.end > .now {
                    current.append(walking)
                } else {
                    finished.append(walking)
                }
            }
            
            if future != futureWalkings {
                futureWalkings = future
            }
            if current != currentWalkings {
                currentWalkings = current
            }
            if finished != finishedWalkings {
                finishedWalkings = finished
            }
        }
    }
}
