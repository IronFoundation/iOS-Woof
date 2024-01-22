import SwiftUI

struct DateRangeView: View {
    let startDate: Date
    let endDate: Date

    var body: some View {
        VStack {
            Text(startDate.formatted(date: .abbreviated, time: .omitted))
                .bold()
                .italic()
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
            HStack {
                Text(startDate.formatted(date: .omitted, time: .shortened))
                Text("-")
                Text(endDate.formatted(date: .omitted, time: .shortened))
            }
        }
    }
}

#Preview {
    DateRangeView(startDate: .now, endDate: .now + 1200)
}
