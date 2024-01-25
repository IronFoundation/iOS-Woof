import SwiftUI

struct AddNewWalkingView: View {
    @State private var selectedDates: Set<Date> = []
    @State private var isCreateButtonTapped = false
    @State private var startTime = Date()
    @State private var durationInMinutes = 15
    @State private var costInput = ""

    struct Walking {
        var start: Date
        var end: Date
    }

    var body: some View {
        VStack {
            Text("Choose day:")
                .font(.headline)

            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                ForEach(monthDates(), id: \.self) { date in
                    DayCell(date: date, isSelected: selectedDates.contains(date)) {
                        toggleDateSelection(date)
                    }
                }
            }
            .padding()

            VStack {
                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)

                Stepper(value: $durationInMinutes, in: 15...24 * 60, step: 15) {
                    Text("Walking duration: \(durationInMinutes) min")
                }
            }
            .padding()

            TextField("Walking cost", text: $costInput)
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
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
                    let walking = Walking(start: startDate, end: endTime)
                    walkingObjects.append(walking)
                }

                for (index, walking) in walkingObjects.enumerated() {
                    print("Walking \(index + 1):")
                    print("Start Time: \(walking.start)")
                    print("End Time: \(walking.end)")
                    print("Cost: \(costInput)")
                    print("-----")
                }

                isCreateButtonTapped.toggle()
                selectedDates.removeAll()
            }) {
                Text("Create walking")
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()

            Spacer()
        }
    }

    private func toggleDateSelection(_ date: Date) {
        if selectedDates.contains(date) {
            selectedDates.remove(date)
        } else {
            selectedDates.insert(date)
        }
    }

    private func monthDates() -> [Date] {
        let calendar = Calendar.current
        let currentDate = Date()
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        return (0..<range.count).map { calendar.date(byAdding: .day, value: $0, to: startOfMonth)! }
    }
}

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

#Preview {
    AddNewWalkingView()
}
