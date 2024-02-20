import SwiftUI

struct OwnerWalkingCardView: View {
    let status: WalkingStatus
    let start: Date
    let end: Date
    var body: some View {
        HStack {
            WalkingSectionView(
                walkingStatus: status,
                name: "Antony",
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
    OwnerWalkingCardView(status: WalkingStatus.pending, start: .now + 1200, end: .now + 2450)
}
