import Foundation

final class CreateNewWalkingViewModel: ObservableObject {
    @Published var startTime = Date()
    @Published var durationInMinutes = 30
    @Published var repeatInterval = WalkingRepeatInterval.never

    func showErrorMessage(for error: Error) -> String {
        switch error {
        case WalkingCreationError.sitterLoadFailed:
            return "Failed to load sitter."
        case WalkingCreationError.dateCalculationFailed:
            return "Failed to calculate time."
        default:
            return "Unknown error occurred."
        }
    }

    func createWalkingsForRepeatInterval() -> Result<[Walking], Error> {
        var walkings: [Walking] = []
        let calendar = Calendar.current
        let currentDate = Date()

        guard let endDatePeriodDate = calendar.date(byAdding: .day, value: 365, to: currentDate) else {
            return .failure(WalkingCreationError.dateCalculationFailed)
        }

        repeat {
            switch createWalking(for: startTime) {
            case let .success(walking):
                walkings.append(walking)
            case let .failure(error):
                return .failure(error)
            }

            guard let newStartDate = calculateNewStartDate(for: startTime) else {
                return .failure(WalkingCreationError.dateCalculationFailed)
            }
            startTime = newStartDate

        } while repeatInterval != .never && startTime <= endDatePeriodDate

        return .success(walkings)
    }

    // MARK: - Private interface

    private func createWalking(for start: Date) -> Result<Walking, Error> {
        guard let endTime = calculateEndTime(for: start) else {
            return .failure(WalkingCreationError.dateCalculationFailed)
        }

        guard let sitter = loadSitter() else {
            return .failure(WalkingCreationError.sitterLoadFailed)
        }

        let walking = Walking(
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
            price: walkingPrice(for: sitter)
        )

        return .success(walking)
    }

    private func calculateNewStartDate(for start: Date) -> Date? {
        guard let calendar = Calendar.current.date(
            byAdding: repeatInterval.dateComponent, value: repeatInterval.value, to: start
        ) else {
            return nil
        }
        return calendar
    }

    private func walkingPrice(for sitter: Sitter) -> Double {
        sitter.pricePerHour * Double(durationInMinutes) / 60.0
    }

    private func loadSitter() -> Sitter? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else { return nil }

        return try? JSONDecoder().decode(Sitter.self, from: data)
    }

    private func calculateEndTime(for startTime: Date) -> Date? {
        Calendar.current.date(byAdding: .minute, value: durationInMinutes, to: startTime)
    }

    private enum WalkingCreationError: Error {
        case sitterLoadFailed
        case dateCalculationFailed
    }
}
