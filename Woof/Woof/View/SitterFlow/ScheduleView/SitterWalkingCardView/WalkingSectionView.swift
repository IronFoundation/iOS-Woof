import SwiftUI

struct WalkingSectionView: View {
    let walkingStatus: WalkingStatus
    let petOwner: String
    let price: String

    var body: some View {
        VStack(alignment: .leading) {
            WalkingStatusLabel(status: walkingStatus)

            Text(petOwner)
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)

            Text(price)
        }
    }
}

#Preview {
    WalkingSectionView(walkingStatus: .pending, petOwner: "Anna", price: "25$")
}
