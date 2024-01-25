import SwiftUI

struct SitterInfoSectionView: View {
    let avatarURL: URL?
    let rating: StarRating
    let fullName: String
    let phoneNumber: String
    let city: String

    var onTapAction: (String) -> Void

    var body: some View {
        HStack(spacing: AppStyle.UIElementConstant.wideSpacingSize) {
            AvatarView(url: avatarURL)

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
                            onTapAction(city)
                        } label: {
                            CopyToClipboardLabel()
                        }
                    }
                Label(city, systemImage: "map")
            }
            .font(
                .system(
                    size: AppStyle.FontStyle.footnote.size
                )
            )
            Spacer()
        }
    }
}

#Preview {
    SitterInfoSectionView(
        avatarURL: Sitter.Dummy.emilyDoe.avatarUrl,
        rating: .rated(.fiveStars),
        fullName: Sitter.Dummy.emilyDoe.name + " " + Sitter.Dummy.emilyDoe.surname,
        phoneNumber: Sitter.Dummy.emilyDoe.phone,
        city: Sitter.Dummy.emilyDoe.city,
        onTapAction: { _ in
            print("Tapped")
        }
    )
}
