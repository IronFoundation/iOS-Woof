import Foundation

final class CreateNewWalkingViewModel: ObservableObject {
    @Published var startTime = Date()
    @Published var durationInMinutes = 30
    @Published var repeatInterval = RepeatInterval.never

    private var sitter: Sitter?

    func createWalking(start: Date) -> Walking? {
        guard let sitter, let endTime = calculateEndTime(for: start) else {
            return nil
        }
        let price = sitter.pricePerHour * (Double(durationInMinutes) / 60.0)
        return Walking(
            id: UUID(),
            owner: nil,
            sitter: sitter,
            status: .available,
            start: start,
            end: endTime,
            ownerRating: nil,
            sitterRating: nil,
            ownerReview: nil,
            sitterReview: nil,
            notes: nil,
            price: price
        )
    }

    func createWalkingsForRepeatInterval() -> Result<[Walking], Error> {
        guard let loadedSitter = loadSitterFromStorage() else {
            return .failure(WalkingCreationError.sitterLoadFailed)
        }
        sitter = loadedSitter

        var walkings: [Walking] = []
        let calendar = Calendar.current
        let currentDate = Date()
        let endDatePeriodDate = calendar.date(byAdding: .day, value: 365, to: currentDate) ?? Date()
        var startTime = startTime

        repeat {
            guard let walking = createWalking(start: startTime) else {
                return .failure(WalkingCreationError.endTimeCalculationFailed)
            }
            walkings.append(walking)

            switch repeatInterval {
            case .daily:
                startTime = calendar.date(byAdding: .day, value: 1, to: startTime)!
            case .weekly:
                startTime = calendar.date(byAdding: .weekOfYear, value: 1, to: startTime)!
            case .biweekly:
                startTime = calendar.date(byAdding: .weekOfYear, value: 2, to: startTime)!
            case .monthly:
                startTime = calendar.date(byAdding: .month, value: 1, to: startTime)!
            default:
                break
            }
        } while repeatInterval != .never && startTime < endDatePeriodDate

        return .success(walkings)
    }

    func errorMessage(for error: Error) -> String {
        switch error {
        case WalkingCreationError.sitterLoadFailed:
            return "Failed to load sitter."
        case WalkingCreationError.endTimeCalculationFailed:
            return "Failed to calculate end time."
        default:
            return "Unknown error occurred."
        }
    }

    private func loadSitterFromStorage() -> Sitter? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else { return nil }

        return try? JSONDecoder().decode(Sitter.self, from: data)
    }

    private func calculateEndTime(for startTime: Date) -> Date? {
        Calendar.current.date(byAdding: .minute, value: durationInMinutes, to: startTime)
    }

    enum WalkingCreationError: Error {
        case sitterLoadFailed
        case endTimeCalculationFailed
        case dateCalculationFailed
    }
}
