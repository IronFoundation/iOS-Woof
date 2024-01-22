import SwiftUI

struct SitterWalkingCardView: View {
    let status: WalkingStatus
    let start: Date
    let end: Date
    var body: some View {
        HStack {
            WalkingSectionView(
                walkingStatus: status.description,
                petOwner: "Anna",
                price: "25$"
            )

            Spacer()

            Divider().background(Color.App.grayLight)

            WalkingDataView(
                month: "September",
                data: "12",
                time: "12:00 - 13:00"
            )
        }
        .padding()
        .background(Color.App.grayLight)
        .clipShape(RoundedRectangle(cornerRadius: AppStyle.UIElementConstant.cornerRadius))
    }
}

#Preview {
    SitterWalkingCardView(status: .booked, start: .now, end: .now + 1200)
}
