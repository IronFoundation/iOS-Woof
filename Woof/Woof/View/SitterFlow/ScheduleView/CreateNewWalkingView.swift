import SwiftUI

struct CreateNewWalkingView: View {
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.top)

        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
            ForEach(viewModel.monthDates(), id: \.self) { date in
                DayCell(date: date, isSelected: viewModel.selectedDates.contains(date)) {
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

        Button(createButtonText) {
            viewModel.createWalkingObjects()
        }
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

    struct DayCell: View {
        let date: Date
        let isSelected: Bool
        let onTap: () -> Void

        var body: some View {
            Text("\(Calendar.current.component(.day, from: date))")
                .frame(width: 40, height: 40)
                .background(isSelected ? Color.App.purpleLight : Color.clear)
                .clipShape(Circle())
                .onTapGesture {
                    onTap()
                }
        }
    }
}

#Preview {
    CreateNewWalkingView()
}
