import SwiftUI

struct CreateNewWalkingView: View {
    var body: some View {
        Text(currentMonth)
            .font(.headline)
            .padding(.top)

        Text(title)
            .font(.headline)

        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
            ForEach(viewModel.getCurrentMonthDates(), id: \.self) { date in
                WalkingCalendarDayCell(date: date, isSelected: viewModel.selectedDates.contains(date)) {
                    viewModel.toggleDateSelection(date)
                }
            }
        }
        .padding()

        VStack {
            DatePicker(dayPickerText, selection: $viewModel.startTime, displayedComponents: .hourAndMinute)

            Stepper(value: $viewModel.durationInMinutes, in: 30...120, step: 30) {
                Text("Walking duration: \(viewModel.durationInMinutes) min")
            }
        }
        .padding()

        Button(createButtonText) {}
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
}

#Preview {
    CreateNewWalkingView()
}
