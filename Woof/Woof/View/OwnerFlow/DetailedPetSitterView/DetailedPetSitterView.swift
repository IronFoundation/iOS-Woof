import SwiftUI

/// A view displaying detailed information about the sitter.
struct DetailPetSitterView: View {
    /// The view model responsible for providing data to the view.
    @ObservedObject var viewModel: DetailSitterViewModel

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AvatarView(url: viewModel.imageURL)
                VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.minPadding) {
                    Text(viewModel.fullName)
                        .bold()
                        .font(.system(size: AppStyle.FontStyle.heading.size))
                        .contextMenu {
                            Button {
                                viewModel.copyToClipboardText(viewModel.fullName)
                            } label: {
                                CopyToClipboardLabel()
                            }
                        }
                    FiveStarRatingView(stars: viewModel.rating)
                    Label(viewModel.phoneNumber, systemImage: .IconName.phone)
                        .contextMenu {
                            Button {
                                viewModel.copyToClipboardText(viewModel.phoneNumber)
                            } label: {
                                CopyToClipboardLabel()
                            }
                        }
                    Label(viewModel.city, systemImage: .IconName.city)
                }
                .font(
                    .system(
                        size: AppStyle.FontStyle.footnote.size
                    )
                )
                Spacer()
                VStack {
                    Text(viewModel.price, format: .currency(code: "USD"))
                    Text("per hour")
                        .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                ExpandableText(
                    lineLimit: 3,
                    text: viewModel.bio,
                    fontSize: AppStyle.FontStyle.footnote.size,
                    showMore: $showMore
                )
                .font(.system(size: AppStyle.FontStyle.footnote.size))
            }
            Spacer()
        }
        .padding()
        .background(Color.App.grayLight)
    }

    @State private var showMore = false
}

struct DetailPetSitterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPetSitterView(
            viewModel: DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
        )
    }
}
