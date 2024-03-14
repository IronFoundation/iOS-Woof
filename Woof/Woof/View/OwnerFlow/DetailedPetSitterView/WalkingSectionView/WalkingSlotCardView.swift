import SwiftUI

/// The view presents an information about available walking slot.
struct WalkingSlotCardView: View {
    /// The price of walking.
    let price: Double

    /// The start date and time of walking.
    let startDate: Date

    /// The end date and time of walking.
    let endDate: Date

    var body: some View {
        VStack {
            HStack {
                Text(startDate, style: .time)
                Text("-")
                Text(endDate, style: .time)
            }
            Divider()
            Text(startDate, style: .date)
                .italic()
            Divider()
            VStack {
                Text(price, format: .currency(code: "USD"))
                    .bold()
            }
        }
        .padding()
        .foregroundColor(.App.purpleDark)
        .background(Color.App.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppStyle.UIElementConstant.cornerRadius
            )
        )
    }
}

#Preview {
    ZStack {
        Color.gray
        WalkingSlotCardView(
            price: 12.25,
            startDate: Date.now,
            endDate: Date.now + 1200
        )
    }
}
