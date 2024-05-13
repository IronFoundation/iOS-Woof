import SwiftUI

struct CreateNewWalkingView: View {
    @StateObject private var viewModel = CreateNewWalkingViewModel()
    @State private var showingErrorAlert = false
    @State private var errorAlertMessage = ""
    private let createWalkingTitle = "Create new walking for"
    private let startDateAndTimeForWalkingLabel = "Start Time:"
    private let durationLabel = "Duration:"
    private let repeatsLabel = "Repeats:"
    private let repeatsIntervalLabel = "Repeat Interval"
    private let createWalkingButton = "Create Walking"

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
                           displayedComponents: [
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
                    ForEach(RepeatInterval.allCases, id: \.self) { interval in
                        Text(interval.rawValue)
                    }
                }
            }

            Button(createWalkingButton) {
                switch viewModel.createWalkings() {
                case let .success(walkings):
                    print(walkings)
                case let .failure(error):
                    errorAlertMessage = viewModel.errorMessage(for: error)
                    showingErrorAlert = true
                }
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorAlertMessage), dismissButton: .default(Text("OK")))
            }

            Spacer()
        }
        .padding()
    }
}

enum RepeatInterval: String, CaseIterable {
    case never = "Never"
    case daily = "Daily"
    case weekly = "Weekly"
    case biweekly = "Every Two Weeks"
    case monthly = "Monthly"
}

#Preview {
    CreateNewWalkingView()
}
