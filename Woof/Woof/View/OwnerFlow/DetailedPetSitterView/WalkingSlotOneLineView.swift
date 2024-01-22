import SwiftUI

struct WalkingSlotOneLineView: View {
    let price: Double
    let startDate: Date
    let endDate: Date

    var body: some View {
        HStack {
            Text(date)
            Spacer()
            Text(time)
            Spacer()

            Text(price, format: .currency(code: "USD"))
                .bold()
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .foregroundColor(Color.App.purpleDark)
        }
        .padding()
        .background(Color.App.white)
        .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }

    private var date: String {
        let month = startDate.formatted(Date.FormatStyle().month(.abbreviated))
        let date = startDate.formatted(Date.FormatStyle().day(.twoDigits))
        return "\(date), \(month)"
    }

    private var time: String {
        let startMinute = startDate.formatted(Date.FormatStyle().minute(.twoDigits))
        let startHours = startDate.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted)))
        let endMinute = endDate.formatted(Date.FormatStyle().minute(.twoDigits))
        let endHours = endDate.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted)))
        return "\(startHours):\(startMinute) - \(endHours):\(endMinute)"
    }
}

#Preview {
    WalkingSlotOneLineView(price: 17.5, startDate: .now, endDate: .now + 3600)
}
