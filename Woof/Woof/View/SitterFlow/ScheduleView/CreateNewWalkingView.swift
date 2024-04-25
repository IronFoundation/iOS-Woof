import SwiftUI

/// A view for creating a new walking schedule,
/// allowing the sitter to select one or multiple days of the week, time, and duration for the walk.
struct CreateNewWalkingView: View {
    var body: some View {
        Text(currentMonth)
            .font(.headline)
            .padding(.top)

        Text(title)
            .font(.headline)

        LazyVGrid(columns: Array(repeating: GridItem(), count: calendarColumnsCount), spacing: calendarGridSpacing) {
            ForEach(viewModel.getCurrentMonthDates(), id: \.self) { date in
                WalkingCalendarDayCell(date: date, isSelected: viewModel.selectedDates.contains(date)) {
                    viewModel.toggleDateSelection(date)
                }
            }
        }
        .padding()

        VStack {
            DatePicker(dayPickerText, selection: $viewModel.startTime, displayedComponents: .hourAndMinute)

            Stepper(value: $viewModel.durationInMinutes,
                    in: viewModel.minWalkingDuration...viewModel.maxWalkingDuration,
                    step: walkDurationChangeStep) {
                Text("Walking duration: \(viewModel.durationInMinutes) min")
            }
        }
        .padding()

        Button(createButtonText) { viewModel.resetSelectedDates() }
            .disabled(viewModel.isCreateButtonDisabled)
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()

        Spacer()
    }

    // MARK: - Private interface

    @StateObject private var viewModel = CreateNewWalkingViewModel()
    private let title = "Choose dates:"
    private let dayPickerText = "Start Time:"
    private let createButtonText = "Create walking"
    private var currentMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: Date())
    }

    private let walkDurationChangeStep = 30
    private let calendarColumnsCount = 7
    private let calendarGridSpacing: CGFloat = 10
}

#Preview {
    CreateNewWalkingView()
}
