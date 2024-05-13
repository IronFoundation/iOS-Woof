import SwiftUI

/// A view providing tools for selecting date, time, and recurrence options for creating walkings in a sitter's schedule.
struct CreateNewWalkingView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text(createWalkingTitle)
                    .font(.headline)
            }

            HStack {
                Text(startDateAndTimeForWalkingLabel)

                Spacer()

                DatePicker("",
                           selection: $viewModel.startTime,
                           in: Date()..., displayedComponents: [
                               .date,
                               .hourAndMinute,
                           ])
                           .labelsHidden()
            }

            HStack {
                Text(durationLabel)

                Spacer()

                Stepper(value: $viewModel.durationInMinutes, in: 30...120, step: 30) {
                    Text("\(viewModel.durationInMinutes) min")
                }
            }

            HStack {
                Text(repeatsLabel)

                Spacer()

                Picker(repeatsIntervalLabel, selection: $viewModel.repeatInterval) {
                    ForEach(WalkingRepeatInterval.allCases, id: \.self) { interval in
                        Text(interval.rawValue)
                    }
                }
            }

            Button(createWalkingButton) {
                switch viewModel.createWalkingsForRepeatInterval() {
                case let .success(walkings):
                    print(walkings)
                case let .failure(error):
                    errorAlertMessage = viewModel.showErrorMessage(for: error)
                    showingErrorAlert = true
                }
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(errorAlertMessage),
                      dismissButton: .default(Text(alertDismissButtonTitle)))
            }

            Spacer()
        }
        .padding()
    }

    // MARK: - Private interface

    @StateObject private var viewModel = CreateNewWalkingViewModel()
    @State private var showingErrorAlert = false
    @State private var errorAlertMessage = ""
    private let createWalkingTitle = "Create new walking for"
    private let startDateAndTimeForWalkingLabel = "Start Time:"
    private let durationLabel = "Duration:"
    private let repeatsLabel = "Repeats:"
    private let repeatsIntervalLabel = "Repeat Interval"
    private let createWalkingButton = "Create Walking"
    private let alertTitle = "Error"
    private let alertDismissButtonTitle = "OK"
}

#Preview {
    CreateNewWalkingView()
}
