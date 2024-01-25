import SwiftUI

struct SitterSlotWalkingInfoView: View {
    let price: Double
    let startDate: Date
    let endDate: Date

    var body: some View {
        VStack {
            Text(time)
                .bold()
            Divider()
            Text(date)
                .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                .italic()
            Divider()
            Text(price, format: .currency(code: "USD"))
                .bold()
        }
        .padding()
        .font(Font.system(size: AppStyle.FontStyle.body.size))
    }

    private var date: String {
        let month = startDate.formatted(Date.FormatStyle().month(.abbreviated))
        let date = startDate.formatted(Date.FormatStyle().day(.twoDigits))
        return "\(date), \(month)"
    }

    private var time: String {
        let startMinute = startDate.formatted(Date.FormatStyle().minute(.twoDigits))
        let startHours = startDate.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted)))
        let start24Hours = startDate.formatted(Date.VerbatimFormatStyle(
            format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased))",
            timeZone: .current,
            calendar: .current
        )
        )
        let endMinute = endDate.formatted(Date.FormatStyle().minute(.twoDigits))
        let endHours = endDate.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted)))
        let end24Hours = endDate.formatted(Date.VerbatimFormatStyle(
            format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased))",
            timeZone: .current,
            calendar: .current
        )
        )
        return "\(start24Hours):\(startMinute) - \(end24Hours):\(endMinute)"
    }
}

#Preview {
    SitterSlotWalkingInfoView(price: 12.75, startDate: .now, endDate: .now + 1200)
}
