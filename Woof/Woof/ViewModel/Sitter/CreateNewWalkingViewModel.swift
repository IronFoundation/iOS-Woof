import Foundation

final class CreateNewWalkingViewModel: ObservableObject {
    /// Set of selected dates for potential walking schedules.
    @Published var selectedDates: Set<Date> = [] {
        didSet {
            isCreateButtonDisabled = selectedDates.isEmpty
        }
    }

    /// Start of walking time for the schedule.
    @Published var startTime = Date()

    /// Duration of the walking in minutes for the schedule.
    @Published var durationInMinutes = 30

    /// Boolean indicating whether the create button is disabled.
    @Published var isCreateButtonDisabled: Bool = true

    var minWalkingDuration: Int = 30
    var maxWalkingDuration: Int = 120

    /// Creates walking objects based on the selected dates, start time, and duration,
    /// considering the sitter's availability and scheduling preferences.
    /// The walking objects are constructed with unique IDs and
    /// relevant details such as start and end times, status, and pricing.
    /// - Note: Ensure that the sitter data is loaded from storage before calling this method.
    /// - Returns: An array of `Walking` objects.
    func createWalkingObjects() -> [Walking] {
        var walkingObjects: [Walking] = []
        guard let sitter = loadSitterFromStorage() else { return walkingObjects }

        for date in selectedDates {
            let calendar = Calendar.current
            let startTimeComponents = calendar.dateComponents([.hour, .minute], from: startTime)
            let startDate = calendar.date(
                bySettingHour: startTimeComponents.hour ?? 0,
                minute: startTimeComponents.minute ?? 0,
                second: 0,
                of: date
            ) ?? date

            let endTime = calendar.date(byAdding: .minute, value: durationInMinutes, to: startDate) ?? startDate

            let validDurationRange = minWalkingDuration...maxWalkingDuration

            if validDurationRange.contains(durationInMinutes) {
                let walking = Walking(id: UUID(),
                                      owner: nil,
                                      sitter: sitter,
                                      status: .available,
                                      start: startDate,
                                      end: endTime,
                                      ownerRating: nil,
                                      sitterRating: nil,
                                      ownerReview: nil,
                                      sitterReview: nil,
                                      notes: nil,
                                      price: walkingPrice)
                walkingObjects.append(walking)
            }
        }
        return walkingObjects
    }

    /// Toggles the selection state of a date in the schedule calendar.
    /// - Parameter date: The date to toggle selection for.
    func toggleDateSelection(_ date: Date) {
        if selectedDates.contains(date) {
            selectedDates.remove(date)
        } else {
            selectedDates.insert(date)
        }
    }

    /// Retrieves the dates for the current month based on the current system date
    /// for use in displaying the schedule calendar.
    /// - Returns: An array of `Date` objects representing the dates in the current month.
    func getCurrentMonthDates() -> [Date] {
        let calendar = Calendar.current
        let currentDate = Date()

        guard let range = calendar.range(of: .day, in: .month, for: currentDate),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return []
        }

        return (0..<range.count).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfMonth) }
    }

    private func loadSitterFromStorage() -> Sitter? {
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else { return nil }

        return try? JSONDecoder().decode(Sitter.self, from: data)
    }

    private var walkingPrice: Double {
        guard let sitter = loadSitterFromStorage() else { return 0 }
        return sitter.pricePerHour * Double(durationInMinutes) / 60.0
    }

    private func setMinWalkingDuration(duration: Int) {
        minWalkingDuration = duration
    }

    private func setMaxWalkingDuration(duration: Int) {
        maxWalkingDuration = duration
    }
}
