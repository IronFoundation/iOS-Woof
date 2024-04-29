import SwiftUI

struct CustomCalendarView: View {
    let selectedDates: Set<Date>
    let onSelectDate: (Date) -> Void

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: calendarColumnsCount), spacing: calendarGridSpacing) {
            ForEach(getCurrentMonthDates(), id: \.self) { date in
                CustomCalendarDayCell(date: date, isSelected: selectedDates.contains(date)) {
                    onSelectDate(date)
                }
            }
        }
        .padding()
    }

    // MARK: - Private interface

    private let calendarColumnsCount = 7
    private let calendarGridSpacing: CGFloat = 10

    private func getCurrentMonthDates() -> [Date] {
        let calendar = Calendar.current
        let currentDate = Date()

        guard let range = calendar.range(of: .day, in: .month, for: currentDate),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return []
        }

        return (0..<range.count).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfMonth) }
    }
}

#Preview {
    CustomCalendarView(selectedDates: Set<Date>(), onSelectDate: { _ in })
}
