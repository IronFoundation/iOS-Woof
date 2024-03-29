import SwiftUI

/// A view displaying information about the pet owner.
struct OwnerCardView: View {
    /// The name of the pet owner.
    let name: String

    /// The surname of the pet owner.
    let surname: String

    /// The phone of the pet owner.
    let phone: String

    /// The city of the pet owner.
    let city: String

    /// The address of the pet owner, street and building.
    let address: String

    /// The URL of the avatar image of the pet owner.
    let avatarUrl: URL?

    var body: some View {
        HStack {
            AvatarView(url: avatarUrl)

            VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                Group {
                    Text(name)
                        .lineLimit(1)
                    Text(surname)
                        .lineLimit(1)
                }
                .font(
                    .system(
                        size: AppStyle.FontStyle.heading.size,
                        weight: .heavy
                    )
                )
                Group {
                    Label(phone, systemImage: .IconName.phone)
                        .lineLimit(1)
                    Label(city, systemImage: .IconName.city)
                        .lineLimit(1)
                    Label(address, systemImage: .IconName.house)
                        .lineLimit(1)
                }
                .font(
                    .system(
                        size: AppStyle.FontStyle.body.size,
                        weight: .bold
                    )
                )
            }
            Spacer()
        }
        .padding()
        .background(Color.App.purpleLight)
        .foregroundColor(.App.white)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }
}

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView(
            name: Owner.Dummy.laraCroft.name,
            surname: Owner.Dummy.laraCroft.surname,
            phone: Owner.Dummy.laraCroft.phone,
            city: Owner.Dummy.laraCroft.city,
            address: Owner.Dummy.laraCroft.address,
            avatarUrl: Owner.Dummy.laraCroft.avatarURL
        )
    }
}
