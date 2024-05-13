import SwiftUI

struct CreateNewWalkingView: View {
    @State private var startTime = Date()
    @State private var durationInMinutes = 30
    @State private var repeatInterval = RepeatInterval.never

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Create new walking for")
                    .font(.headline)
            }

            HStack {
                Text("Start Time:")

                Spacer()

                DatePicker("",
                           selection: $startTime,
                           displayedComponents: [
                               .date,
                               .hourAndMinute,
                           ])
                           .labelsHidden()
            }

            HStack {
                Text("Duration:")

                Spacer()

                Stepper(value: $durationInMinutes, in: 30...120, step: 30) {
                    Text("\(durationInMinutes) min")
                }
            }

            HStack {
                Text("Repeats:")

                Spacer()

                Picker("Repeat Interval", selection: $repeatInterval) {
                    ForEach(RepeatInterval.allCases, id: \.self) { interval in
                        Text(interval.rawValue)
                    }
                }
            }

            Button("Create Walking") {}

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
