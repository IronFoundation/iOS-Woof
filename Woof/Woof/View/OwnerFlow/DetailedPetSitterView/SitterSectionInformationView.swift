import SwiftUI

/// A view presents the section of personal information about the sitter.
struct SitterSectionInformationView: View {
    /// The full name of the person.
    let fullName: String

    /// The rating of the person.
    let rating: StarRating

    /// The phone number the person.
    let phoneNumber: String

    /// The city or area where the person works.
    let city: String

    // The action that should be performed, when button was pressed from context menu.
    let onTapAction: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.minPadding) {
            Text(fullName)
                .bold()
                .font(.system(size: AppStyle.FontStyle.heading.size))
                .contextMenu {
                    Button {
                        onTapAction(fullName)
                    } label: {
                        CopyToClipboardLabel()
                    }
                }
            FiveStarRatingView(stars: rating)
            Label(phoneNumber, systemImage: .IconName.phone)
                .contextMenu {
                    Button {
                        onTapAction(phoneNumber)
                    } label: {
                        CopyToClipboardLabel()
                    }
                }
            Label(city, systemImage: .IconName.city)
        }
        .font(
            .system(
                size: AppStyle.FontStyle.footnote.size
            )
        )
    }
}

#Preview {
    SitterSectionInformationView(
        fullName: "Kate Anderson",
        rating: StarRating.rated(Stars.fiveStars),
        phoneNumber: "123-456-789",
        city: "Minsk",
        onTapAction: { _ in }
    )
}
