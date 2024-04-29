import SwiftUI

struct CustomCalendarView: View {
    /// Set of selected dates.
    let selectedDates: Set<Date>
    /// Closure called when a date is selected.
    let onSelectDate: (Date) -> Void

    var body: some View {
        VStack {
            HStack {
                Button {
                    let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth) ?? Date()
                    if !isCurrentMonth(selectedMonth) {
                        selectedMonth = previousMonth
                    }
                } label: {
                    Image(systemName: .IconName.chevronLeft)
                }
                .opacity(isCurrentMonth(selectedMonth) ? 0 : 1)

                Text(currentMonth)

                Button {
                    selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth) ?? Date()
                } label: {
                    Image(systemName: .IconName.chevronRight)
                }
            }
            .font(.title)

            LazyVGrid(columns: Array(repeating: GridItem(), count: calendarColumnsCount),
                      spacing: calendarGridSpacing) {
                ForEach(getCurrentMonthDates(for: selectedMonth), id: \.self) { date in
                    CustomCalendarDayCell(date: date, isSelected: selectedDates.contains(date))
                        .onTapGesture {
                            onSelectDate(date)
                        }
                }
            }
            .padding()
        }
    }

    // MARK: - Private interface

    @State private var selectedMonth = Date()
    private let calendarColumnsCount = 7
    private let calendarGridSpacing: CGFloat = 10
    private var currentMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: selectedMonth)
    }

    private func getCurrentMonthDates(for month: Date) -> [Date] {
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: month),
              let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month)) else {
            return []
        }

        return (0..<range.count).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfMonth) }
    }

    private func isCurrentMonth(_ month: Date) -> Bool {
        let currentCalendar = Calendar.current
        let currentComponents = currentCalendar.dateComponents([.year, .month], from: Date())
        let selectedComponents = currentCalendar.dateComponents([.year, .month], from: month)
        return selectedComponents.year == currentComponents.year && selectedComponents.month == currentComponents.month
    }
}

#Preview {
    CustomCalendarView(selectedDates: Set<Date>(), onSelectDate: { _ in })
}
