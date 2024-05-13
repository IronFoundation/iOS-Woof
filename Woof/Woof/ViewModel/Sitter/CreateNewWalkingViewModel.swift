import Foundation

/// The view model responsible for the logic of creating a schedule for a sitter's walkings.
final class CreateNewWalkingViewModel: ObservableObject {
    /// The start time of the walking.
    @Published var startTime = Date() {
        didSet {
            if startTime < Date() {
                startTime = Date()
            }
        }
    }

    /// The duration of the walking in minutes.
    @Published var durationInMinutes = 30

    /// The repeat interval for creating multiple walkings.
    @Published var repeatInterval = WalkingRepeatInterval.never

    /// Returns a descriptive error message for a given error.
    ///
    /// - Parameter error: The error for which to generate the message.
    /// - Returns: A string containing the error message.
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

    /// Creates a series of walkings based on the repeat interval.
    ///
    /// - Returns: A result containing an array of walkings or an error if creation fails.
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
        guard let calendarDate = Calendar.current.date(
            byAdding: repeatInterval.dateComponent, value: repeatInterval.value, to: start
        ) else {
            return nil
        }
        return calendarDate
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
