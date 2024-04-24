import Foundation

final class CreateNewWalkingViewModel: ObservableObject {
    @Published var selectedDates: Set<Date> = [] {
        didSet {
            isCreateButtonDisabled = selectedDates.isEmpty
        }
    }

    @Published var startTime = Date()
    @Published var durationInMinutes = 30
    @Published var price: Double = 0
    @Published var isCreateButtonDisabled: Bool = true

    func toggleDateSelection(_ date: Date) {
        if selectedDates.contains(date) {
            selectedDates.remove(date)
        } else {
            selectedDates.insert(date)
        }
    }

    func createWalkingObjects(sitter: Sitter) -> [Walking] {
        var walkingObjects: [Walking] = []

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
                                  price: price)
            walkingObjects.append(walking)
        }

        return walkingObjects
    }

    func monthDates() -> [Date] {
        let calendar = Calendar.current
        let currentDate = Date()

        guard let range = calendar.range(of: .day, in: .month, for: currentDate),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return []
        }

        return (0..<range.count).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfMonth) }
    }
}
