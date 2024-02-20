import SwiftUI

struct WalkingSectionView: View {
    let walkingStatus: WalkingStatus
    let name: String
    let price: String

    var body: some View {
        VStack(alignment: .leading) {
            WalkingStatusLabel(status: walkingStatus)

            Text(name)
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)

            Text(price)
        }
    }
}

#Preview {
    WalkingSectionView(walkingStatus: .pending, name: "Anna", price: "25$")
}
