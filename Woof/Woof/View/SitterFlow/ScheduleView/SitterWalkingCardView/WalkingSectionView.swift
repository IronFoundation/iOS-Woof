import SwiftUI

struct WalkingSectionView: View {
    let walkingStatus: String
    let petOwner: String
    let price: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(walkingStatus)
                .foregroundColor(.App.grayLight)
                .fontWeight(.medium)
                .padding(AppStyle.UIElementConstant.minPadding)
                .background(Color.App.purpleLight)
                .clipShape(Capsule())

            Text(petOwner)
                .font(Font.system(size: AppStyle.FontStyle.heading.size))
                .bold()
                .foregroundColor(.App.purpleDark)

            Text(price)
        }
    }
}

#Preview {
    WalkingSectionView(walkingStatus: "Pending", petOwner: "Anna", price: "25$")
}
