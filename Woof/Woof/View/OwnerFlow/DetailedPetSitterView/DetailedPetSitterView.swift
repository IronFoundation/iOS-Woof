import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        VStack {
            AvatarView(url: viewModel.imageURL)
            FiveStarRatingView(stars: viewModel.rating)
            TextWithIconLabelView(
                iconName: .IconName.filledPerson,
                text: viewModel.fullName
            )
            .contextMenu {
                Button {
                    viewModel.copyToClipboardText(viewModel.fullName)
                } label: {
                    CopyToClipboardLabel()
                }
            }

            TextWithIconLabelView(
                iconName: .IconName.phone,
                text: viewModel.phoneNumber
            )
            .contextMenu {
                Button {
                    viewModel.copyToClipboardText(viewModel.phoneNumber)
                } label: {
                    CopyToClipboardLabel()
                }
            }

            TextWithIconLabelView(
                iconName: .IconName.house,
                text: viewModel.city
            )

            Text(viewModel.bio)
            Spacer()
        }
        .padding()
        .background(Color.App.grayLight)
    }

    struct DetailPetSitterView_Previews: PreviewProvider {
        static var previews: some View {
            DetailPetSitterView(
                viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
            )
        }
    }
}
