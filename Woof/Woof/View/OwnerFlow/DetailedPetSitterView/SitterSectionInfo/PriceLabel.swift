import SwiftUI

/// A view displaying information about the costs per hour with specified currency.
struct PriceLabel: View {
    /// The price to present.
    let price: Double

    var body: some View {
        VStack {
            Text(price, format: .currency(code: "USD"))
                .bold()
                .font(.system(size: AppStyle.FontStyle.heading.size))
            Text(pricePerHourText)
                .font(Font.system(size: AppStyle.FontStyle.footnote.size))
        }.foregroundColor(.App.purpleDark)
    }

    // MARK: - Private interface

    private let pricePerHourText = "per hour"
}

#Preview {
    PriceLabel(price: 20.75)
}
