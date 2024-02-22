import SwiftUI

struct PriceLabel: View {
    /// The price associated with the person.
    let price: Double

    var body: some View {
        VStack {
            Text(price, format: .currency(code: "USD"))
                .bold()
                .font(.system(size: AppStyle.FontStyle.heading.size))
            Text("per hour")
                .font(Font.system(size: AppStyle.FontStyle.footnote.size))
        }.foregroundColor(.App.purpleDark)
    }
}

#Preview {
    PriceLabel(price: 20.75)
}
