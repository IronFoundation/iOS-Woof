import SwiftUI

struct WalkingSlotCardView: View {
    let price: Double
    let startDate: Date
    let endDate: Date

    var body: some View {
        HStack {
            DateRangeView(startDate: startDate, endDate: endDate)
            Spacer()
            VStack {
                Text(price, format: .currency(code: "USD"))
                    .bold()
                    .font(Font.system(size: AppStyle.FontStyle.heading.size))
                    .foregroundColor(Color.App.purpleDark)
            }
        }
        .padding()
        .background(Color.App.white)
        .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }
}

#Preview {
    WalkingSlotCardView(
        price: 25.0,
        startDate: .now,
        endDate: .now + 1200
    )
}
