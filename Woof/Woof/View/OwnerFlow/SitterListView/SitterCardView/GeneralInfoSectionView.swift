import SwiftUI
/// A view displaying general information about a person.
struct GeneralInfoSectionView: View {
    /// The full name of the person.
    let fullName: String

    /// The rating of the person.
    let rating: StarRating

    /// The price associated with the person.
    let price: Double

    /// The city or area where the person works.
    let city: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fullName)
                    .bold()
                    .lineLimit(1)
                Text(city)
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                    .bold()
                    .foregroundColor(.App.purpleDark)
            }
            Spacer()
            PriceLabel(price: price)
        }
        .padding(.vertical, AppStyle.UIElementConstant.minPadding)
        .font(Font.system(size: AppStyle.FontStyle.heading.size))
        .foregroundColor(Color.App.grayDark)
    }
}

struct GeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoSectionView(
            fullName: "Kate Anderson",
            rating: .unavailable,
            price: 18.78,
            city: "Minsk"
        )
    }
}
