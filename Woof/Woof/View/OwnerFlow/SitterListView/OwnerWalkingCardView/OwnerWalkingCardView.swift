import SwiftUI

struct OwnerWalkingCardView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Price: 25$")
                Spacer()
                Button("Book") {}
                    .buttonStyle(CapsuleWithWhiteText())
            }
            .padding()

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
    OwnerWalkingCardView()
}
