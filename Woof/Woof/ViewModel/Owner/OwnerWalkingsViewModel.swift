import Foundation

final class OwnerWalkingsViewModel: ObservableObject {
    @Published var futureWalkings: [Walking] = []
    @Published var finishedWalkings: [Walking] = []

    init() {
        Task {
            await getWalkings()
        }
    }

    @MainActor func getWalkings() async {
        let walkings = await fetchWalkings()

        futureWalkings = walkings.filter { $0.start > Date() }
        finishedWalkings = walkings.filter { $0.end < Date() }
    }

    private func fetchWalkings() async -> [Walking] {
        Walking.Dummy.bulkDummyWalkings
    }
}
