import SwiftUI

struct SitterBioSectionView: View {
    let avatarURL: URL?
    let rating: StarRating
    let fullName: String
    let phoneNumber: String
    let city: String
    let bio: String

    @Binding var showMore: Bool

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

                Text(city)
                    .italic()
            }
            .font(
                .system(
                    size: AppStyle.FontStyle.body.size
                )
            )
            Spacer()
        }
    }
}

#Preview {
    SitterBioSectionView(
        avatarURL: Sitter.Dummy.emilyDoe.avatarUrl,
        rating: .rated(.fiveStars),
        fullName: Sitter.Dummy.emilyDoe.name + " " + Sitter.Dummy.emilyDoe.surname,
        phoneNumber: Sitter.Dummy.emilyDoe.phone,
        city: Sitter.Dummy.emilyDoe.city,
        bio: Sitter.Dummy.emilyDoe.bio,
        showMore: .constant(true),
        onTapAction: { _ in
            print("Tapped")
        }
    )
}
