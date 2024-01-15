import SwiftUI

struct SitterWalkingCardView: View {
    var body: some View {
        HStack {
            WalkingSectionView(
                walkingStatus: "Pending",
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
    SitterWalkingCardView()
}
